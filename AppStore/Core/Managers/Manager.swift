//
//  Manager.swift
//  AppStore
//
//  Created by Vladimir Gusev on 26.06.2022.
//

import Foundation

protocol Manager {
    func fetchITunesApps(searchTerm: String, completion: @escaping( Result<SearchResult, Error>) -> ())
    func fetchGames(completion: @escaping (Result<AppGroup, Error>) -> ())
}
