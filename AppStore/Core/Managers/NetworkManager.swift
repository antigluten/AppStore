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
    
    func createQuery() {
        
    }
    
    func fetchITunesApps(searchTerm: String, completion: @escaping (Result<SearchResult, Error>) -> Void) {
        let url = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
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

            guard let decodedData = try? JSONDecoder().decode(SearchResult.self, from: data) else {
                completion(.failure(NetworkErrors.failedToDecode))
                return
            }
            
            completion(.success(decodedData))
        }
        
        task.resume()
    }
    
    func fetchGames(completion: @escaping (Result<AppGroup, Error>) -> ()) {
        guard let url = URL(string: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/25/apps.json") else {
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

            guard let decodedData = try? JSONDecoder().decode(AppGroup.self, from: data) else {
                completion(.failure(NetworkErrors.failedToDecode))
                return
            }
            
            completion(.success(decodedData))
        }
        
        task.resume()
    }
}
