//
//  TagsAddToRealm.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 03/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import RealmSwift

class TagsWriteToRealm {
    
    var realmObjects: [TagDBDataModel] = []
    
    let realmConfig = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    init(tags: [Tag]) {
        
        var counter = 0
        
        for tag in tags {
            let tagRealm = TagDBDataModel()
            tagRealm.id = counter
            tagRealm.media_count = tag.media_count
            tagRealm.name = tag.name
            self.realmObjects.append(tagRealm)
            counter += 1
        }
        
    }
    
    func writeToRealm() {
        for realmObject in self.realmObjects {
            do {
                let realm = try Realm(configuration: self.realmConfig)
                realm.beginWrite()
                realm.add(realmObject, update: true)
                try realm.commitWrite()
            } catch {
                print(error)
            }
        }
    }
}
