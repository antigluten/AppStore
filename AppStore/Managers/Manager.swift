//
//  Manager.swift
//  AppStore
//
//  Created by Vladimir Gusev on 26.06.2022.
//

import Foundation

protocol Manager {
    func fetchITunesApps(completion: @escaping( Result<SearchResult, Error>) -> ())
}
