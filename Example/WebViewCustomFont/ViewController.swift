//
//  ViewController.swift
//  WebViewCustomFont
//
//  Created by Juyeon Lee on 01/11/2022.
//  Copyright (c) 2022 Juyeon Lee. All rights reserved.
//

import UIKit
import WebKit
import WebViewCustomFont

class ViewController: UIViewController, WKNavigationDelegate {
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        return webView
    }()
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(webView)
        
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                webView.topAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                webView.leftAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor),
                webView.bottomAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                webView.rightAnchor
                    .constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor)
            ])
        } else {
            webView.frame = view.bounds
        }
    }
    
    private func loadHtml(_ filename: String) {
        let htmlURL = Bundle.main.bundleURL.appendingPathComponent(filename)
        webView.loadFileURL(htmlURL, allowingReadAccessTo: Bundle.main.bundleURL)
        webView.injectScript(fontFileName: "Pecita", type: .otf, fontFamilyName: "pecita")
        webView.injectScript(fontFileName: "zagreb_underground", type: .ttf, fontFamilyName: "zagreb")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadHtml("index.html")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("End loading")
        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                   completionHandler: { (html: Any?, error: Error?) in
            print(String(describing: html))
        })
    }
}

