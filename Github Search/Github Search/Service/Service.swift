//
//  Service.swift
//  Github Search
//
//  Created by Walter A Ramirez on 3/1/23.
//

import Foundation
import Combine

protocol GithubService {
    func request(from endpoint: GithubAPI) -> AnyPublisher<SearchResponse, APIError>
}

struct GithubServiceImpl: GithubService {
    func request(from endpoint: GithubAPI) -> AnyPublisher<SearchResponse, APIError> {
        
        return URLSession
            .shared
            .dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<SearchResponse, APIError > in
           
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode) {
                    let jsonDecoder = JSONDecoder()
                    
                    return Just(data)
                        .decode(type: SearchResponse.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                    
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
}

