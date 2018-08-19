//
//  AuthenticationViewController.swift
//  Instagram-client-geekbrains
//
//  Created by Timur Sasin on 19/08/2018.
//  Copyright © 2018 Timur Sasin. All rights reserved.
//

import UIKit
import WebKit

class AuthenticationViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    weak var delegate: AuthenticationViewControllerDelegate?
    
    let clientId = "a3444926a0bb4c1e9470aaa84e3a0c62"
    let redirectURI = "https://www.instagram.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlUnwrapped = URL(string: "https://api.instagram.com/oauth/authorize/?client_id=\(clientId)&redirect_uri=\(redirectURI)&response_type=token")
        
        guard let url = urlUnwrapped else { return }
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 15.0)
        webView.navigationDelegate = self
        self.removeCache()
        webView.load(request)
    }
    
    func removeCache() {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            for record in records {
                dataStore.removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
            }
        }
    }

}

extension AuthenticationViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let urlString =  navigationAction.request.url?.absoluteString else {
            decisionHandler(.allow)
            return
        }
        
        guard urlString.range(of: "#access_token") != nil else {
            decisionHandler(.allow)
            return
        }
        
        guard let accessToken = urlString.components(separatedBy: "#access_token=").last else { return }
        
        self.delegate?.authenticationViewController(self, authorizedWith: accessToken)
        
        decisionHandler(.cancel)
        
    }
}
