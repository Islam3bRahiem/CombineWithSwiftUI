//
//  WriterDetailsViewModel.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation

protocol WriterDetailsViewModelViewModelInput {
    func viewDidLoad()
}

protocol WriterDetailsViewModelViewModelOutput {
    var name: String { get }
    var price: String { get }
    var imageURL: String? { get }
}

protocol WriterDetailsViewModelProtocol: ObservableObject {
    var input: WriterDetailsViewModelViewModelInput { get }
    var output: WriterDetailsViewModelViewModelOutput { get }
}


class WriterDetailsViewModel: WriterDetailsViewModelProtocol, WriterDetailsViewModelViewModelInput, WriterDetailsViewModelViewModelOutput {
    
    var input: WriterDetailsViewModelViewModelInput {
        return self
    }
    
    var output: WriterDetailsViewModelViewModelOutput {
        return self
    }
    
    init(writer: DynamodbWriterViewModel?) {
        self.name = writer?.name ?? ""
        self.imageURL = writer?.thumbnail ?? ""
        self.price = writer?.price ?? ""
    }
    
    @Published
    var name: String
    
    @Published
    var price: String
    
    @Published
    var imageURL: String?
    
    
    
    func viewDidLoad() {

    }
}
