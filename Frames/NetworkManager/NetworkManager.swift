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
    
    func getPictures(comlited: @escaping ([Picture]?, String?) -> Void) {
        
        guard let url = URL(string: urlOFRandomPhotos) else {
            comlited(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                comlited(nil, "Unable to complited your request. Please check your internet connection")
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                comlited(nil, "Ivalid response from server. Please, try again")
                return
            }
            
            guard let data = data else {
                comlited(nil, "The data received from server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let pictures = try decoder.decode([Picture].self, from: data)
                comlited(pictures, nil)
            } catch {
                comlited(nil, "The data received from server was invalid. Please6 try again.")
            }
        }
        task.resume()
    }
    
    
    //    private func request(completion: @escaping (Data?, Error?) -> Void) {
    //        var request = URLRequest(url: URL(string: urlOFRandomPhotos)!)
    //        request.httpMethod = "GET"
    //        let task = URLSession.shared.dataTask(with: request) { data, responce, error in
    //            DispatchQueue.main.async {
    //                completion(data, error)
    //            }
    //        }
    //        task.resume()
    //    }
    //
    //    func fetchData(completion: @escaping (Picture?) -> ()) {
    //        request { data, error in
    //            if let error = error {
    //                print("Error received requesting data: \(error.localizedDescription)")
    //                completion(nil)
    //            }
    //            do {
    //                let json = try JSONDecoder().decode([Picture].self, from: data!)
    //                print(json)
    //
    //            } catch {
    //                print("Cant decoder: \(error.localizedDescription)")
    //            }
    //        }
    //    }
}



