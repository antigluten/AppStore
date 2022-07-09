//
//  SearchResult.swift
//  AppStore
//
//  Created by Vladimir Gusev on 25.06.2022.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [ResultEntity]
}

struct ResultEntity: Decodable {
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    let description: String
    
    let screenshotUrls: [String]
    let artworkUrl100: String
    
    let formattedPrice: String
    let releaseNotes: String
}
