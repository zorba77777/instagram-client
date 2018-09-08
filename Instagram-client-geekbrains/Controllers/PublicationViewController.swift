//
//  PublicationViewController.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 08/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

class PublicationViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var likes: UILabel!
    
    var photo: Photo?
    
    let imageDownloader = ImageFetchHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let publication = self.photo else { return }
        
        self.photoImageView.image = imageDownloader.getImage(urlString: publication.url)
        self.user.text = publication.user.username
        self.caption.text = publication.caption
        self.likes.text = String(publication.likes_count)
    }

}
