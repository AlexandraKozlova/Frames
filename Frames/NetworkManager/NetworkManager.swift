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
    
    func getPictures(comlited: @escaping ([Picture]?, ErrorMessage?) -> Void) {
        
        guard let url = URL(string: urlOFRandomPhotos) else {
            comlited(nil, ErrorMessage.invalidResponse)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                comlited(nil, ErrorMessage.unableToComplite)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                comlited(nil, ErrorMessage.invalidResponse)
                return
            }
            
            guard let data = data else {
                comlited(nil, ErrorMessage.invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pictures = try decoder.decode([Picture].self, from: data)
                comlited(pictures, nil)
            } catch {
                comlited(nil, ErrorMessage.invalidData)
            }
        }
        task.resume()
    }
}



