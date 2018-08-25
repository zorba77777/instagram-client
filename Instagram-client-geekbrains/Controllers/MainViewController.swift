//
//  MainViewController.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 19/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UserDelegate {
    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.getUser() {
            [unowned self]
            userUnwrapped in
            guard let user = userUnwrapped else {return}
            self.userCreated(user)
        }
    }
   
    func userCreated(_ user: User) {
        DispatchQueue.main.async {
            self.userNameLabel.text = user.username
        }
    }
}
