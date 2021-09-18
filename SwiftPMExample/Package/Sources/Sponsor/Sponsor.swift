import SwiftUI
import WebView

public struct Sponsor: View {
    let url: URL

    public init(url: URL) {
        self.url = url
    }

    public var body: some View {
        WebView(request: .init(url: url), configuration: .init())
    }
}

struct Sponsor_Previews: PreviewProvider {
    static var previews: some View {
        Sponsor(url: .init(string: "https://iosdc.jp/2021/sponsor.html")!)
    }
}

