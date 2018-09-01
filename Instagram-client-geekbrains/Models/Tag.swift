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
    
    init(response: [String:Any]) {
        
        media_count = response["media_count"] as! Int
        name = response["name"] as! String
    }
}
