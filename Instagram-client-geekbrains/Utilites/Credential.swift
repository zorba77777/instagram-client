//
//  Credential.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 19/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

class Credential {
    
    static let userDefaultsTokenKey = "userDefaultsTokenKey"
    
    static var token: String? {
        get {
            return UserDefaults.standard.value(forKey: userDefaultsTokenKey) as? String
        }
        set {
            UserDefaults.standard.set(newValue, forKey: userDefaultsTokenKey)
        }
    }
    
    static var isUserAuthenticated: Bool {
        return token != nil
    }
    
}
