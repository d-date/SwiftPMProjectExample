import Build
import SwiftUI
import Home

@main
struct HomePreviewApp: App {

    var body: some Scene {
        WindowGroup {
            Home(build: .live, primaryColor: .init("PrimaryColor", bundle: .main))
        }
    }
}
