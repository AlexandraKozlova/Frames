//
//  Favorite.swift
//  Frames
//
//  Created by Aleksandra on 17.04.2022.
//

import Foundation
import RealmSwift

class Favorite: Object {
    @objc dynamic var user = ""
    @objc dynamic var urls =  ""
   
    convenience init(user: String, urls: String) {
        self.init()
        self.user = user
        self.urls = urls
    }
}
