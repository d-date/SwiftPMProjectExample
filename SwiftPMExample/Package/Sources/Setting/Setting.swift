import SwiftUI
import WebView

public struct Setting: View {

    public init() {

    }

    public var body: some View {
        NavigationView {
            List {
                NavigationLink("Sign in fortee", destination:
                    WebView(request: .init(url: URL(string: "https://fortee.jp/login")!), configuration: .init())
                )
            }
            .navigationTitle("Settings")
        }
    }
}
