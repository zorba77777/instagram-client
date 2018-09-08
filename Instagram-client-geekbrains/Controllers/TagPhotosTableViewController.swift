//
//  TagPhotosTableViewController.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 07/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

class TagPhotosTableViewController: UITableViewController {
    
    var photos: [Photo] = []
    
    var tag: Tag!
    
    let imageDownloader = ImageFetchHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "#" + tag.name
        self.loadPhotos()
    }
    
    func loadPhotos() {
        APIManager.shared.getPhotosForTag(tag) { (newPhotos) in
            self.photos = newPhotos
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoTagCell", for: indexPath) as! PhotoTableCell
        
        let photo = self.imageDownloader.getImage(urlString: photos[indexPath.row].url)
        
        cell.photoView.image = photo
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 500.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        self.performSegue(withIdentifier: "showSinglePublication", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showSinglePublication" {
            
            guard let cell = sender as? UITableViewCell else { return }
            
            guard let index = self.tableView.indexPath(for: cell)?.row else { return }
            
            guard let publicationController = segue.destination as? PublicationViewController else { return }
            
            publicationController.photo = self.photos[index]
        }
    }
}
