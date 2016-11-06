//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Rodrigo Carballo on 11/5/16.
//  Copyright © 2016 Rodrigo Carballo. All rights reserved.
//

import UIKit
import WebKit

class WebViewController:  UIViewController, WKUIDelegate {
    
    @IBOutlet var containerView : UIView? = nil
    
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://www.bignerdranch.com/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
        
        
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

}
