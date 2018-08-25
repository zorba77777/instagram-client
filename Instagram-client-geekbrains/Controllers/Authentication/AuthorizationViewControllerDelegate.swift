//
//  AuthenticationViewControllerDelegate.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 25/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import Foundation
import UIKit

protocol AuthorizationViewControllerDelegate: class {
    
    func authorizationViewController(_ viewController: UIViewController, authorizedWith token:String?)
    
}
