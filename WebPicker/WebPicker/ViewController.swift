//
//  ViewController.swift
//  WebPicker
//
//  Created by Daniel on 1/7/24.
//

import UIKit
import WebKit


class ViewController: UIViewController {

    var webView : WKWebView!;
    let activityIndicator = UIActivityIndicatorView(style: .gray)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.center = view.center
        self.view = activityIndicator
        activityIndicator.startAnimating()
        webView = WKWebView();
        webView.navigationDelegate = self
        self.view = webView
        let loadUrl = "https://www.facebook.com"
        let url = URL(string: loadUrl )!
        webView.load(URLRequest(url: url))
        activityIndicator.stopAnimating()
        webView.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
    }

}

extension ViewController : WKNavigationDelegate{
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
          activityIndicator.startAnimating()
      }
      
      func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
          activityIndicator.stopAnimating()
      }
}
