//
//  Picture.swift
//  Frames
//
//  Created by Aleksandra on 05.04.2022.
//

import Foundation

struct Picture: Codable, Hashable {
    let id: String
    let width: Int
    let height: Int
    let urls: [UrlsKind.RawValue : String]
    
    enum UrlsKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
