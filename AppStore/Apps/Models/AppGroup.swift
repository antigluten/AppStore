//
//  AppGroup.swift
//  AppStore
//
//  Created by Vladimir Gusev on 07.07.2022.
//

import Foundation

struct AppGroup: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Codable {
    let id: String
    let name: String
    let artistName: String
    let artworkUrl100: String
}
