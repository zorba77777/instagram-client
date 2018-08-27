//
//  PublicationDataProvider.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 27/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

class PublicationDataProvider: AbstractDataProvider {
    
    func getRecentPhotos(_ completion: @escaping ([Photo]) -> Void) {
        
        if let urlString = urlConstructor.getUrlString() {
            api.load(urlString) {
                json in
                if let resultArray = (json as? [String:Any])?["data"] as? [[String:Any]] {
                    var photos: [Photo] = []
                    for object in resultArray {
                        photos.append(Photo(response: object))
                    }
                    completion(photos)
                } else {
                    completion([])
                }
            }
        }
    }
    
    func getPhotosByTag(_ tag: String, _ completion: @escaping ([Photo]) -> Void) {
        
        if let urlString = urlConstructor.getUrlString(param: tag) {
            
            api.load(urlString) {
                json in
                if let result = (json as? [String:Any])?["data"] as?
                    [[String:Any]] {
                    var photos: [Photo] = []
                    for object in result {
                        photos.append(Photo(response: object))
                    }
                    completion(photos)
                } else {
                    completion([])
                }
            }
        }
    }
    
}
