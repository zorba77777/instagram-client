//
//  MainViewController.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 19/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    struct API {
        static let host = "https://api.instagram.com/v1"
        static let token = "?access_token="
        
        static func URLFor(apiMethod: String, token: String)-> String {
            return self.host + apiMethod + self.token + token
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        userNameLabel.text = "loading..."
        self.getUser()
    }
    
    func getUser() {
        
        guard let token = Credential.token else {
            return
        }
        
        APIManager.shared.load(API.URLFor(apiMethod: "/users/self", token: token), {[weak self] (result) in
            
            guard let result = (result as? [String: Any])?["data"] as? [String: Any] else {
                DispatchQueue.main.async {
                    self?.userNameLabel.text = "error"
                }
                return
            }
            
            let user = User(dictionary: result)
            
            DispatchQueue.main.async {
                self?.userNameLabel.text = user.userName
            }
        })
    }

}
