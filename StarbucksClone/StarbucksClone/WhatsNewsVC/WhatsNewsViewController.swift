//
//  WhatsNewsViewController.swift
//  StarbucksClone
//
//  Created by 박지승 on 2020/03/11.
//  Copyright © 2020 Hailey. All rights reserved.
//

import UIKit
import WebKit

class WhatsNewsViewController: UIViewController {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.istarbucks.co.kr/whats_new/news_list.do?cate=N01")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

extension WhatsNewsViewController: WKUIDelegate {
    
}
