import SwiftUI
import WebView

public struct Blog: View {

    var url: URL
    public init(url: URL) {
        self.url = url
    }

    public var body: some View {
        WebView(request: .init(url: url), configuration: .init())
    }
}

struct Blog_Previews: PreviewProvider {
    static var previews: some View {
        Blog(url: .init(string: "https://blog.iosdc.jp")!)
    }
}
