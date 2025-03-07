//
// Created by TMA on 02/20/25.
//
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String
    @Binding var isLoading: Bool
    @Binding var showError: Bool

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator

        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        return webView
    }

    // MARK: - Functions

    func updateUIView(_: WKWebView, context _: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        func webView(_: WKWebView, didFinish _: WKNavigation!) {
            // MARK: - Finished loading

            parent.isLoading = false
        }

        func webView(_: WKWebView, didFail _: WKNavigation!, withError _: Error) {
            // MARK: - Failed to load

            parent.isLoading = false
            parent.showError = true
        }

        func webView(_: WKWebView, didFailProvisionalLoadWithError _: Error) {
            // MARK: - Failed to load

            parent.isLoading = false
            parent.showError = true
        }

        func webView(_: WKWebView, didFailProvisionalNavigation _: WKNavigation!, withError _: Error) {
            // MARK: - Failed to load

            parent.isLoading = false
            parent.showError = true
        }
    }
}
