//
//  AppDelegate.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 19/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()

        let firstViewController: UIViewController

        if Credential.userIsAuthorized {
            let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
            firstViewController = mainViewController
        } else {
            guard let authorizationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Authorization") as? AuthorizationViewController else {
                return false
            }
            authorizationController.delegate = self
            firstViewController = authorizationController
        }

        self.window?.rootViewController = firstViewController
        self.window?.makeKeyAndVisible()
        return true
    }
}


extension AppDelegate: AuthorizationViewControllerDelegate {
    func authorizationViewController(_ viewController: UIViewController, authorizedWith token: String?) {
        Credential.token = token
        let mainViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController")
        viewController.present(mainViewController, animated: true, completion: nil)
    }
}



