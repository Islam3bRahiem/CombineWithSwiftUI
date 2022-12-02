//
//  DynamodbWriterViewModel.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation

struct DynamodbWriterViewModel: Identifiable {
    let id: String
    let name: String
    let price: String
    let thumbnail: String
    
    init(_ model: DynamodbWriterModel) {
        self.id = model.uid ?? ""
        self.name = model.name ?? "No name"
        self.price = model.price ?? "AED 0"
        self.thumbnail = model.imageUrlsThumbnails?.first ?? ""
    }
}
