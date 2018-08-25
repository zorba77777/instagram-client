//
//  Credential.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 19/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

class Credential {
    
    static var userIsAuthorized: Bool {
        if (token != nil) {
            return true
        }
        return false
    }
    
    static var token: String? {
        get {
            return UserDefaults.standard.value(forKey: "token") as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "token")
        }
    }
}
