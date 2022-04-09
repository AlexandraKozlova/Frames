//
//  PictureInfo.swift
//  Frames
//
//  Created by Aleksandra on 05.04.2022.
//

import Foundation

struct PictureInfo: Codable {
    let createdAt: Date
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
    }


struct Picturef: Codable {
    let pictureURL: String
    
    enum CodingKeys: String, CodingKey {
        case pictureURL = "html"
    }
}

struct User: Codable {
    let firstName: String
    let lastName: String?
    let location: String?
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case location
    }
}
}
