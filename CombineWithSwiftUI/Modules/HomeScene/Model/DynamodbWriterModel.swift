//
//  DynamodbWriterModel.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation

// MARK: - DynamodbWriterModel
struct DynamodbWriterResponse: Codable {
    let results: [DynamodbWriterModel]
    let pagination: Pagination?
}

// MARK: - Pagination
struct Pagination: Codable {
    let key: String?
}

// MARK: - Result
struct DynamodbWriterModel: Codable {
    let createdAt, price, name, uid: String?
    let imageIDS: [String]?
    let imageUrls, imageUrlsThumbnails: [String]?

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}
