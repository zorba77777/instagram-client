//
//  APIManager.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 20/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import UIKit

class APIManager {
    
    private init() { }
    
    static let shared: APIManager = APIManager()
    
    func load(_ url: String, _ completion: @escaping (Any?) -> Void) {
        
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(try? JSONSerialization.jsonObject(with: data, options: .mutableContainers))
            }.resume()
    }
    
}
