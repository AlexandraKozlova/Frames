//
//  Picture.swift
//  Frames
//
//  Created by Aleksandra on 05.04.2022.
//

import Foundation

struct Picture: Codable, Hashable {
    let views: Int
    let downloads: Int
    let width: Int
    let height: Int
    let user: User
    let urls: [String : String]
    
    struct User: Codable, Hashable {
        let name: String
        let location: String?
    }
    
}
