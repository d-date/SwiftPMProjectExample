import Build
import SwiftUI
import TimeTable

@main
struct TimeTablePreviewApp: App {

    let build: Build = .live

    var body: some Scene {
        WindowGroup {
            Timetable(url: build.timetableURL())
                .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}
