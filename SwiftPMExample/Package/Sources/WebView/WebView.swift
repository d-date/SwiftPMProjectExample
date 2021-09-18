import SwiftUI
import WebKit

#if os(macOS)
typealias ViewRepresentable = NSViewRepresentable
#else
typealias ViewRepresentable = UIViewRepresentable
#endif


public struct WebView: ViewRepresentable {
    let request: URLRequest
    let configuration: WKWebViewConfiguration

    public init(request: URLRequest, configuration: WKWebViewConfiguration) {
        self.request = request
        self.configuration = configuration
    }

    #if os(macOS)
    public func makeNSView(context: Context) -> WKWebView {
        let webview = WKWebView(frame: .zero, configuration: configuration)
        webview.uiDelegate = context.coordinator
        webview.navigationDelegate = context.coordinator

        webview.load(request)
        return webview
    }

    public func updateNSView(_ nsView: WKWebView, context: Context) {
        
    }
    #else
    public func makeUIView(context: Context) -> WKWebView {
        let webview = WKWebView(frame: .zero, configuration: configuration)
        webview.uiDelegate = context.coordinator
        webview.navigationDelegate = context.coordinator

        webview.load(request)
        return webview
    }

    public func updateUIView(_ uiView: WKWebView, context: Context) {

    }
    #endif

    public func makeCoordinator() -> Coordinator {
        .init()
    }

    public class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
    }
}
