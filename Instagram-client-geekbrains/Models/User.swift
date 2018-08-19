//
//  User.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 20/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

struct User {
    
    let identifier: Int
    let userName: String
    let avatarImageURLString: String
    let fullName: String
    
    init(identifier: Int, userName: String, avatarImageURLString: String, fullName: String) {
        self.identifier = identifier
        self.userName = userName
        self.avatarImageURLString = avatarImageURLString
        self.fullName = fullName
    }
    
    init(dictionary: [String: Any]) {
        
        guard
            let idString = dictionary["id"] as? String,
            let userName = dictionary["username"] as? String,
            let avatarUrl = dictionary["profile_picture"] as? String,
            let fullName = dictionary["full_name"] as? String
            else
        {
            self.init(identifier: 0, userName: "", avatarImageURLString: "", fullName: "")
            return
        }
        
        guard let id = Int(idString) else {
            self.init(identifier: 0, userName: "", avatarImageURLString: "", fullName: "")
            return
        }
        
        self.init(
            identifier: id,
            userName: userName,
            avatarImageURLString: avatarUrl,
            fullName: fullName
        )
    }
    
}
