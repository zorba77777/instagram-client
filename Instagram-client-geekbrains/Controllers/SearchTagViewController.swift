//
//  ViewController.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 02/09/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

class SearchTagViewController: UITableViewController {
    
    var searchField: UITextField = UITextField()
    var searchButton: UIButton = UIButton()
    
    private let userDefaults = UserDefaults.standard
    
    private let realmLoader = TagsLoadFromRealm()
    
    var tags: [Tag] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configure()
    }

    @objc func searchTags() {
        guard let tag = self.searchField.text else {return}
        
        APIManager.shared.searchTag(tag: tag) {
            [unowned self]
            tags in
           
            DispatchQueue.main.async {
                
                self.tags = tags
                let realmWriter = TagsWriteToRealm(tags: self.tags)
                
                self.addEmptyTagOnTop()
                self.tableView.reloadData()
                
                realmWriter.writeToRealm()
                self.userDefaults.set(true, forKey: "tagsFirtSearch")
                
            }
            
        }
        
    }
    
    func configure() {
        
        self.configureSearchField()
        self.configureSearchButton()
        
        if !self.isFirstSearch() {
            self.realmLoader.load()
            self.tags = realmLoader.objects
            self.addEmptyTagOnTop()
        }
    }
    
    func configureSearchField() {
        
        self.searchField.frame = CGRect(x: 0, y: 0, width: 150, height: 30.00)
        self.searchField.borderStyle = UITextBorderStyle.line
        self.searchField.backgroundColor = UIColor.white
        self.view.addSubview(self.searchField)
    }
    
    func configureSearchButton() {
        
        let inputButton = UIButton(frame: CGRect(x: 150, y: 0, width: 100, height: 30))
        inputButton.setTitle("Search", for: .normal)
        inputButton.backgroundColor = UIColor.orange
        inputButton.addTarget(self, action: #selector(self.searchTags), for: .touchUpInside)
        self.view.addSubview(inputButton)
    }
    
    func addEmptyTagOnTop() {
        
        let emptyTag = Tag(response: ["media_count": 0,"name": ""])
        self.tags.insert(emptyTag, at: 0)
    }
    
    func isFirstSearch()->Bool {
        if self.userDefaults.object(forKey: "tagsFirtSearch") == nil {
            return true
        } else {
            return false
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchedTagsCell", for: indexPath)
        cell.textLabel?.text = "#" + tags[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tags.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        self.performSegue(withIdentifier: "showPublications", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showPublications" {
            
            guard let cell = sender as? UITableViewCell else { return }
            
            guard let index = self.tableView.indexPath(for: cell)?.row else { return }
            
            guard let publicationController = segue.destination as? TagPhotosTableViewController else { return }
           
            publicationController.tag = self.tags[index]
            
        }
    }
    
}
