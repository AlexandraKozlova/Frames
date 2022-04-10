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
        
        guard let url = URL(string: urlOFRandomPhotos) else {
            completion(.failure(.invalidResponse))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplite))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pictures = try decoder.decode([Picture].self, from: data)
                completion(.success(pictures))
            } catch {
                completion(.failure(.invalidData))
                }
           }
        task.resume()
        }
 }
