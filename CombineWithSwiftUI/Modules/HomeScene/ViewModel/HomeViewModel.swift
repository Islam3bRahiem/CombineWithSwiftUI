//
//  HomeViewModel.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation
import Combine

protocol HomeViewModelInput {
    func viewDidLoad()
}

protocol HomeViewModelOutput {
    var isFetching: Bool { get }
    var alertItem: AlertItem? { get set }
    var dataSource: [DynamodbWriterViewModel] { get }
}

protocol HomeViewModelProtocol: ObservableObject {
    var input: HomeViewModelInput { get set }
    var output: HomeViewModelOutput { get set }
}


final
class HomeViewModel: HomeViewModelProtocol, HomeViewModelInput, HomeViewModelOutput {
    
    
    var input: HomeViewModelInput {
        get { return self }
        set {}
    }
    
    var output: HomeViewModelOutput {
        get { return self }
        set {}
    }
    
    private
    var cancellable: AnyCancellable?

    private
    var homeClient: HomeClientProtocol
    
    init(homeClient: HomeClientProtocol = HomeClient()) {
        self.homeClient = homeClient
    }
    
    // MARK: - Outputs
    @Published
    var isFetching: Bool = true

    @Published
    var dataSource: [DynamodbWriterViewModel] = []
    
    @Published
    var alertItem: AlertItem?
        
    
    // MARK: - Inputs
    func viewDidLoad() {
        isFetching = true
        cancellable = homeClient.fetchHomeData()
            .sink(receiveCompletion: { completion in
                self.isFetching = false
                switch completion {
                case .finished:
                    break
                case .failure:
                    self.alertItem = AlertContext.invalidResponse
                }
            },
            receiveValue: {
                print(".sink() response :", $0.results)
                self.isFetching = false
                self.dataSource = $0.results.map { DynamodbWriterViewModel($0) }
                if self.dataSource.isEmpty {
                    self.alertItem = AlertContext.emptyData
                }
            })
    }
 
}

