import Build
import SwiftUI
import Sponsor

@main
struct SponsorPreviewApp: App {

    let build: Build = .live

    var body: some Scene {
        WindowGroup {
            Sponsor(url: build.sponsorURL())
                .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}
