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
            return URL(string: url)!
        }, iOSDCJapanWebURL: {
            let url = Bundle.main.infoDictionary!["iOSDC JAPAN URL"] as! String
            return URL(string: url)!
        }, sponsorURL: {
            let url = Bundle.main.infoDictionary!["Sponsor URL"] as! String
            return URL(string: url)!
        }, bloglinkURL: {
            let url = Bundle.main.infoDictionary!["Bloglink URL"] as! String
            return URL(string: url)!
        }, timetableURL: {
            let url = Bundle.main.infoDictionary!["Timetable URL"] as! String
            return URL(string: url)!
        }, blogURL: {
            let url = Bundle.main.infoDictionary!["Blog URL"] as! String
            return URL(string: url)!
        }
    )

    static var none = Self(
        eventbriteURL: { URL(string: "https://")! },
        iOSDCJapanWebURL: { URL(string: "https://")! },
        sponsorURL: { URL(string: "https://")! },
        bloglinkURL: { URL(string: "https://")! },
        timetableURL: { URL(string: "https://")! },
        blogURL: { URL(string: "https://")! }
    )
}
