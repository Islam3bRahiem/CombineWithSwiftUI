//
//  HomeClient.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation
import Combine

protocol HomeClientProtocol {
    func fetchHomeData() -> AnyPublisher<DynamodbWriterResponse, Error>
}

final class HomeClient: NetworkManagerAPI, HomeClientProtocol {
    
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func fetchHomeData() -> AnyPublisher<DynamodbWriterResponse, Error> {
        execute(HomeService.dynamodbWrit.request, decodingType: DynamodbWriterResponse.self, retries: 2)
    }
}

