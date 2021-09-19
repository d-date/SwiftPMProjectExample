import Build
import SwiftUI
import BlogLinks
import WebView

public struct Home: View {

    var build: Build

    var primaryColor: Color

    public init(build: Build, primaryColor: Color) {
        self.build = build
        self.primaryColor = primaryColor
    }

    public var body: some View {
        NavigationView {
            ZStack {
                WebView(request: .init(url: build.iOSDCJapanWebURL()), configuration: .init())
                VStack {
                    Spacer()
                    Button(action: {
                        let url = build.eventbriteURL()
                        #if os(macOS)
                        NSWorkspace.shared.open(url)
                        #else
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        #endif
                    }, label: {
                        HStack {
                            Spacer()
                            Image(systemName: "ticket")
                            Text("Buy Ticket", bundle: .module)
                            Spacer()
                        }
                    })
                        .buttonStyle(PrimaryButtonStyle(primaryColor: primaryColor))
                    NavigationLink(destination: BlogLinks(url: build.bloglinkURL()), label: {
                        HStack {
                            Spacer()
                            Image(systemName: "pencil")
                            Text("Post your report", bundle: .module)
                            Spacer()
                        }
                    })
                        .buttonStyle(PrimaryButtonStyle(primaryColor: primaryColor))
                }
                .padding()
            }

            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(build: .none, primaryColor: Color.init(.label)).environment(\.locale, .init(identifier: "ja"))
    }
}


var conferenceDateInterval: String {
    let start = DateComponents(calendar: .autoupdatingCurrent, timeZone: .autoupdatingCurrent, year: 2021, month: 9, day: 17, hour: 0, minute: 0, second: 0, nanosecond: 0)
    let end = DateComponents(calendar: .autoupdatingCurrent, timeZone: .autoupdatingCurrent, year: 2021, month: 9, day: 19, hour: 0, minute: 0, second: 0, nanosecond: 0)
    let formatter = DateIntervalFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .none
    return formatter.string(from: start.date!, to: end.date!)
}


struct PrimaryButtonStyle: ButtonStyle {

    let primaryColor: Color

    func makeBody(configuration: Configuration) -> some View {
        #if os(macOS)
        return configuration.label
            .font(Font.body.bold())
            .foregroundColor(.init(.windowBackgroundColor))
            .opacity(configuration.isPressed ? 0.2 : 1.0)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .foregroundColor(primaryColor)
            )
            .cornerRadius(4.0)
            .shadow(color: Color(.labelColor).opacity(0.12), radius: 20, x: 0, y: 6)
        #else
        return configuration.label
            .font(Font.body.bold())
            .foregroundColor(.init(.systemBackground))
            .opacity(configuration.isPressed ? 0.2 : 1.0)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .foregroundColor(primaryColor)
            )
            .cornerRadius(4.0)
            .shadow(color: Color(.label).opacity(0.12), radius: 20, x: 0, y: 6)
        #endif
    }
}
