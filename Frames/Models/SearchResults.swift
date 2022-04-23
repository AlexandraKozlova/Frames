//
//  SearchResults.swift
//  Frames
//
//  Created by Aleksandra on 20.04.2022.
//

import Foundation

struct SearchResult: Codable {
    let total: Int
    let total_pages: Int
    let results: [Picture]
}

