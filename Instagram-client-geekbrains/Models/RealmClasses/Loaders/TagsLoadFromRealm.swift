//
//  TagsLoadFromRealm.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 03/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import RealmSwift

class TagsLoadFromRealm {
    
    let realmConfig = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    var objects: [Tag] = []
    
    func load() {
        do {
            let realm = try Realm(configuration: realmConfig)
            let tags = realm.objects(TagDBDataModel.self)
            
            for tag in tags {
                
                let tag = Tag(name: tag.name, media_count: tag.media_count)
                self.objects.append(tag)
                
            }
        } catch {
            print(error)
        }
    }
}

