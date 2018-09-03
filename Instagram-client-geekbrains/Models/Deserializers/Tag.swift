//
//  Tag.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 25/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

class Tag {
    
    let media_count: Int
    let name: String
    
    init(response: [String: Any]) {
        
        self.media_count = response["media_count"] as! Int
        self.name = response["name"] as! String
    }
    
    init(name: String, media_count: Int) {
        
        self.media_count = media_count
        self.name = name
    }
}
