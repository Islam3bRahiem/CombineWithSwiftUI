//
//  HomeService.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation

enum HomeService {
    case dynamodbWrit
}

extension HomeService: Endpoint {
    
    var base: String {
        return "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
    }
    
    var path: String {
        switch self {
        case .dynamodbWrit: return "/default/dynamodb-writer"
        }
    }
}
