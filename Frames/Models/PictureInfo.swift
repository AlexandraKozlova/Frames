//
//  PictureInfo.swift
//  Frames
//
//  Created by Aleksandra on 02.05.2022.
//

import Foundation

struct PictureInfo: Codable {
    let id: String
    let views: Int
    let downloads: Int
    let user: User
    let urls: [String : String]
    
    struct User: Codable {
        let name: String
        let location: String?
    }
}
