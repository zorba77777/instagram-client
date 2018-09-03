//
//  MainViewController.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 19/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    let imageDownloader = ImageFetchHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.getUser() {
            [unowned self]
            userUnwrapped in
            guard let user = userUnwrapped else {return}
            guard let image = self.imageDownloader.getImage(urlString: user.profile_picture) else {return}
            DispatchQueue.main.async {
                self.name.text = user.full_name
                self.photo.image = image
            }
        }
        
    }
    
}
