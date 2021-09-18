import SwiftUI
import AppFeature

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(build: .live, primaryColor: .init("PrimaryColor", bundle: .main))
        }
    }
}
