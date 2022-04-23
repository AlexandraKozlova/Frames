//
//  NetworkManager.swift
//  Frames
//
//  Created by Aleksandra on 06.04.2022.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    let urlOFRandomPhotos = "https://api.unsplash.com/photos/random/?count=30&client_id=\(accessKey)"
    
    func getPictures(completion: @escaping (Result<[Picture], ErrorMessage>) -> Void) {
        guard let url = URL(string: urlOFRandomPhotos)
        else {
            completion(.failure(.invalidResponse))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let _ = error {
                completion(.failure(.unableToComplite))
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let pictures = try decoder.decode([Picture].self, from: data)
                completion(.success(pictures))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func getSearchResult(query: String, completion: @escaping (Result<[Picture], ErrorMessage>) -> Void) {
        let urlOFSearchPhotos = "https://api.unsplash.com/search/photos?page=1&per_page=30&query=\(query)&client_id=\(accessKey)"
        
        guard let url = URL(string: urlOFSearchPhotos)
        else {
            completion(.failure(.wrongName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in

            guard let data = data, error == nil
            else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let jsonResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(.success(jsonResult.results))
               
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
