//
//  User.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 20/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

class User {
    
    let id: Int
    let username: String
    let profile_picture: String
    let full_name: String
    let bio: String?
    let website: String?
    let mediaCount: Int
    let followsCount: Int
    let followedByCount: Int
    
    private var delegate: UserDelegate?
    
    convenience init(response: [String:Any], delegate: UserDelegate?) {
        
        self.init(response: response)
        self.delegate = delegate
        self.delegate?.userCreated(self)
    }
    
    init(response: [String:Any]) {
        
        id = Int(response["id"] as! String)!
        username = response["username"] as! String
        profile_picture = response["profile_picture"] as! String
        full_name = response["full_name"] as! String
        bio = response["bio"] as? String
        website = response["website"] as? String
        
        if let counts = response["counts"] as? [String:Int] {
            mediaCount = counts["media"]!
            followsCount = counts["follows"]!
            followedByCount = counts["followed_by"]!
        } else {
            mediaCount = 0
            followsCount = 0
            followedByCount = 0
        }
    }
}
