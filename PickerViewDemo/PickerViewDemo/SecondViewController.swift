//
//  SecondViewController.swift
//  PickerViewDemo
//
//  Created by Suraj Prasad on 22/02/19.
//  Copyright © 2019 Suraj Prasad. All rights reserved.
//

import UIKit
import WebKit

class SecondViewController: UIViewController, WKNavigationDelegate {
    //MARK:- IBoutlets
    @IBOutlet weak var pickedLabel: UILabel!
    @IBOutlet weak var webKitView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    //MARK:- Global Variables
    var websiteName = " "
    var webUrl = "https://www.google.com"
    //MARK:- Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        loading.alpha = 1.0
        webKitView.navigationDelegate=self
        if let url = URL(string:webUrl ) {
        pickedLabel.text = websiteName
        
            webKitView.load(URLRequest(url: url))
        
        loading.startAnimating()
        loading.isHidden = false
        }
    }
    //MARK:- WKNavigation Delegate Methods
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        loading.alpha = 0.1
        loading.stopAnimating()
        print("did commit working")
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        loading.alpha=0.0
        loading.stopAnimating()
        loading.isHidden=true
        print("did finish working")
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        pickedLabel.text = "Error 404. Go back and Try Again"
    }
}
