//
//  GithubRepository.swift
//  Github Search
//
//  Created by Walter A Ramirez on 3/1/23.
//

import Foundation

struct SearchResponse: Codable {
    let repos: [GithubRepository]
}
struct GithubRepository: Codable {
    let htmlUrl: String
    let fullName: String
    let language: String?
    let stargazersCount: Int

    enum CodingKeys: String, CodingKey {
        case htmlUrl
        case fullName
        case language
        case stargazersCount = "stargazers_count"
    }
}
