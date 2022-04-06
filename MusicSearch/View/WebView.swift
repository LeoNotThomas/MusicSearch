//
//  WebView.swift
//  MusicSearch
//
//  Created by Thomas (privat) Leonhardt on 05.04.22.
//

import Foundation

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: String
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        print("update WebView")
    }
    
}
