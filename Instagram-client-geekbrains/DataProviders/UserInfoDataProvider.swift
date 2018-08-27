//
//  UserInfoDataProvider.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 27/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

class UserInfoDataProvider: AbstractDataProvider {
    
    func getUserSelf(_ completion: @escaping (User?) -> Void) {
        
        if let urlString = self.urlConstructor.getUrlString() {
            self.api.load(urlString) {
                json in
                if let result = (json as? [String:Any])?["data"] as? [String:Any] {
                    completion(User(response: result))
                } else {
                    completion(nil)
                }
            }
        }
    }
    
}
