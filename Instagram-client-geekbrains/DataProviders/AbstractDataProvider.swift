//
//  AbstractDataProvider.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 27/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

class AbstractDataProvider {
    
    let urlConstructor: URLStringConstructor
    
    let api = APIManager.shared
    
    init(urlRequestType: URLStringConstructor) {
        self.urlConstructor = urlRequestType
    }
    
}
