import SwiftUI
import WebView

public struct BlogLinks: View {

    var url: URL
    public init(url: URL) {
        self.url = url
    }

    public var body: some View {
        WebView(request: .init(url: url), configuration: .init())
    }
}

struct BlogLinks_Previews: PreviewProvider {
    static var previews: some View {
        BlogLinks(url: URL(string: "https://fortee.jp/iosdc-japan-2021/blog-link")!)
    }
}

