import SwiftUI
import WebView

public struct Timetable: View {
    let url: URL
    
    public init(url: URL) {
        self.url = url
    }

    public var body: some View {
        WebView(request: .init(
            url: url),
                configuration: .init()
        )
    }
}

struct Timetable_Previews: PreviewProvider {
    static var previews: some View {
        Timetable(url: .init(string: "https://fortee.jp/iosdc-japan-2021/timetable")!)
    }
}

