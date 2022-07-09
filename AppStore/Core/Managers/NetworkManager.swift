//
//  NetworkManager.swift
//  AppStore
//
//  Created by Vladimir Gusev on 25.06.2022.
//

import Foundation

class NetworkManager: Manager {
    enum NetworkErrors: String, Error {
        case invalidURL
        case failedFetchingData
        case invalidData
        case failedToDecode
    }
    
    enum Endpoint: String {
        case search
    }
    
    enum Category: String, CaseIterable {
        case topFree = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json"
        case topPaid = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/25/apps.json"
        case topFreeGB = "https://rss.applemarketingtools.com/api/v2/gb/apps/top-free/10/apps.json"
        case trending = "https://api.letsbuildthatapp.com/appstore/social"
    }
    
    func createQuery() {
        
    }
    
    func fetch<T: Decodable>(with url: String, completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: url) else {
            completion(.failure(NetworkErrors.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(.failure(NetworkErrors.failedFetchingData))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkErrors.invalidData))
                return
            }

            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(NetworkErrors.failedToDecode))
                return
            }
            
            completion(.success(decodedData))
        }
        
        task.resume()
    }
    
    func fetchITunesApps(searchTerm: String, completion: @escaping (Result<SearchResult, Error>) -> Void) {
        let url = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetch(with: url, completion: completion)
    }
    
    func fetchGames(type: Category, completion: @escaping (Result<AppGroup, Error>) -> ()) {
        fetch(with: type.rawValue, completion: completion)
    }
    
    func fetchTrending(completion: @escaping (Result<[SocialApp], Error>) -> ()) {
        fetch(with: Category.trending.rawValue, completion: completion)
    }
}
