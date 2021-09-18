import SwiftUI
import Blog
import Build
import Home
import TimeTable
import Sponsor
import Setting

public struct ContentView: View {

    var build: Build
    var primaryColor: Color

    public init(build: Build, primaryColor: Color) {
        self.build = build
        self.primaryColor = primaryColor
    }

    public var body: some View {
        TabView {
            Home(build: build, primaryColor: primaryColor)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Timetable(url: build.timetableURL())
                .tabItem {
                    Image(systemName: "clock")
                    Text("Timetable")
                }
            Blog(url: build.blogURL())
                .tabItem {
                    Image(systemName: "building.columns.fill")
                    Text("Blog")
                }
            Sponsor(url: build.sponsorURL())
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Sponsor")
                }
            Setting()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Setting")
                }


        }
        .accentColor(primaryColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(build: .none, primaryColor: .black)
    }
}
