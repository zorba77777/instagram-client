//
//  LastPhotoViewController.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 25/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

class RecentPhotoViewController: UIViewController {
    
    let dataProvider = PublicationDataProvider(urlRequestType: .photosRecent)
    
    let imageDownloader = ImageFetchHelper()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataProvider.getRecentPhotos() {
            [unowned self]
            
            photos in
            
            for photo in photos {
                guard let image = self.imageDownloader.getImageData(urlString: photo.url) else {return}
                
                DispatchQueue.main.async {
                    self.addSubview(image: image)
                }
            }
        }
    }
    
    func addSubview(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        self.view.addSubview(imageView)
    }

}
