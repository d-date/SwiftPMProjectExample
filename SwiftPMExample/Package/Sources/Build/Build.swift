import Foundation

public struct Build {
    public var eventbriteURL: () -> URL

    public var iOSDCJapanWebURL: () -> URL

    public var sponsorURL: () -> URL

    public var bloglinkURL: () -> URL

    public var timetableURL: () -> URL

    public var blogURL: () -> URL
}

public extension Build {
    static var live = Self(
        eventbriteURL: {
            let url = Bundle.main.infoDictionary!["Eventbrite URL"] as! String
            return .init(string: url)!
        }, iOSDCJapanWebURL: {
            let url = Bundle.main.infoDictionary!["iOSDC JAPAN URL"] as! String
            return .init(string: url)!
        }, sponsorURL: {
            let url = Bundle.main.infoDictionary!["Sponsor URL"] as! String
            return .init(string: url)!
        }, bloglinkURL: {
            let url = Bundle.main.infoDictionary!["Bloglink URL"] as! String
            return .init(string: url)!
        }, timetableURL: {
            let url = Bundle.main.infoDictionary!["Timetable URL"] as! String
            return .init(string: url)!
        }, blogURL: {
            let url = Bundle.main.infoDictionary!["Blog URL"] as! String
            return .init(string: url)!
        }
    )

    static var none = Self(
        eventbriteURL: { .init(string: "https://")! },
        iOSDCJapanWebURL: { .init(string: "https://")! },
        sponsorURL: { .init(string: "https://")! },
        bloglinkURL: { .init(string: "https://")! },
        timetableURL: { .init(string: "https://")! },
        blogURL: { .init(string: "https://")! }
    )
}
