//
//  TagDBDataModel.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 02/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import RealmSwift

class TagDBDataModel: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var media_count = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
