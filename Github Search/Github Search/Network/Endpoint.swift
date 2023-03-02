//
//  Endpoint.swift
//  Github Search
//
//  Created by Walter A Ramirez on 3/1/23.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum  GithubAPI {
    case getRepo
    }
    
extension GithubAPI: APIBuilder {

    var baseUrl: URL {
        switch self {
        case .getRepo:
            return URL(string: "https://developer.github.com")!
        }
    }
    
    
    var path: String {
        return "/v3/search"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathExtension(self.path))
    }
}
