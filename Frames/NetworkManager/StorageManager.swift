//
//  StorageManager.swift
//  Frames
//
//  Created by Aleksandra on 17.04.2022.
//

import Foundation
import RealmSwift

let realm = try! Realm()

class StorageManager {

    static func saveObject (_ favorite: Favorite) {
        try! realm.write {
            realm.add(favorite)
        }
    }

    static func deleteObject (_ favorite: Favorite) {
        try! realm.write {
            realm.delete(favorite)
        }
    }
}


