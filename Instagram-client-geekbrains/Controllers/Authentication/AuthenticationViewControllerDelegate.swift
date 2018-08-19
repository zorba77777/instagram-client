//
//  AuthenticationViewControllerDelegate.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 20/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import UIKit

protocol AuthenticationViewControllerDelegate: class {
    
    func authenticationViewController(_ viewController: UIViewController, authorizedWith token:String?)
    
}
