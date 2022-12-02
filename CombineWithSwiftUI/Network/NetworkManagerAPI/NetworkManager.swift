//
//  NetworkManager.swift
//  CombineWithSwiftUI
//
//  Created by Mac
//

import Foundation
import Combine

protocol NetworkManagerAPI {
    var session: URLSession { get }
    func execute<T>(_ request: URLRequest, decodingType: T.Type, queue: DispatchQueue, retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

// 2
extension NetworkManagerAPI {
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue = .main,
                    retries: Int = 0) -> AnyPublisher<T, Error> where T: Decodable {
        return session.dataTaskPublisher(for: request)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse, response.statusCode == 200 else {
                    throw APIError.responseUnsuccessful
                }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
}
