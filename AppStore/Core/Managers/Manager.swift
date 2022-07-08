//
//  Manager.swift
//  AppStore
//
//  Created by Vladimir Gusev on 26.06.2022.
//

import Foundation

protocol Manager {
    func fetchITunesApps(searchTerm: String, completion: @escaping( Result<SearchResult, Error>) -> ())
    func fetchGames(type: NetworkManager.GameCategory, completion: @escaping (Result<AppGroup, Error>) -> ())
    func fetchTrending(completion: @escaping (Result<[SocialApp], Error>) -> ())
}
