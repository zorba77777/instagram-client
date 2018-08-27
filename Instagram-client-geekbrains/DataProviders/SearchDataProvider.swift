//
//  TagsDataProvider.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 27/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

class SearchDataProvider: AbstractDataProvider {
    
    func searchByTag(tag: String, _ completion: @escaping ([Tag]) -> Void) {
        
        if let urlString = urlConstructor.getUrlString(param: tag) {
            api.load(urlString) {
                json in
                if let result = (json as? [String:Any])?["data"] as? [[String:Any]] {
                    var tags: [Tag] = []
                    for object in result {
                        tags.append(Tag(response: object))
                    }
                    completion(tags)
                } else {
                    completion([])
                }
            }
        }
    }
    
}
