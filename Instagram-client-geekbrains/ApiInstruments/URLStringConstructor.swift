//
//  URLConstructor.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 27/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

enum URLStringConstructor {
    
    var host: String {return "https://api.instagram.com/v1/"}
    
    var tokenUrlParam: String {return "?access_token="}
    
    case userSelf
    case photosRecent
    case tagsSearch
    case photosByTag
    
    func getUrlString(param: String? = nil)->String? {
        
        guard let token = Credential.token else {return nil}
        
        switch self {
            case .userSelf:
                return self.host + "users/self/" + self.tokenUrlParam + token
            case .photosRecent:
                return self.host + "users/self/media/recent/" + self.tokenUrlParam + token
            case .tagsSearch:
                guard let tag = param else {return nil}                
                return (self.host + "tags/search" + self.tokenUrlParam + token + "&q=" + tag).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            case .photosByTag:
                guard let tag = param else {return nil}
                return (self.host + "tags/" + tag + "/media/recent" + self.tokenUrlParam + token).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        }
    }
   

}
