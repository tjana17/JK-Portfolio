//
//  WebView.swift
//  JK-Portfolio
//
//  Created by Janarthanan Kannan on 01/01/25.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let webView: WKWebView

    init() {
        self.webView = WKWebView()

    }

    func makeUIView(context: Context) -> WKWebView {
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {

    }

    func loadURL(urlString: String) {
        webView.load(URLRequest(url: URL(string: urlString)!))
    }
}
