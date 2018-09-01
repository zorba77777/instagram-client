//
//  ImageFetchHelper.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 25/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation

import UIKit

class ImageFetchHelper {
    
    func getImageData(urlString: String) -> UIImage? {
        
        guard let url = URL(string: urlString) else {
            print("Something went wrong with image url")
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            print("Something went wrong with image data")
            return nil
        }
        
        guard let image = UIImage(data: data) else {
            return nil
        }
        
        return image
    }
}


