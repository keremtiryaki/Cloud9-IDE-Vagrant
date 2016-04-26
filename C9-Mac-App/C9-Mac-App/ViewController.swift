//
//  ViewController.swift
//  C9-Mac-App
//
//  Created by k on 26/04/16.
//  Copyright © 2016 k. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet weak var webView: WebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://10.0.0.222:8181/"
        
        print(url);
        self.webView.mainFrame.loadRequest(NSURLRequest(URL: NSURL(string: url)!))
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: AnyObject? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}
