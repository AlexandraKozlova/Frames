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
    @objc dynamic var id = ""
   
    convenience init(user: String, urls: String, id: String) {
        self.init()
        self.user = user
        self.urls = urls
        self.id = id
    }
}
