// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Package",
    defaultLocalization: "en",
    platforms: [.iOS(.v14), .macOS(.v11), .watchOS(.v6), .tvOS(.v14)],
    products: [
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "HomeFeature", targets: ["Home", "Build"]),
        .library(name: "SettingFeature", targets: ["Setting"]),
        .library(name: "SponsorFeature", targets: ["Sponsor", "Build"]),
        .library(name: "TimeTableFeature", targets: ["TimeTable", "Build"]),
    ],
    dependencies: [
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk", from: "8.6.0")
    ],
    targets: [
        .target(name: "AppFeature", dependencies: [
            "Home",
            "Blog",
            "TimeTable",
            "Sponsor",
            "Setting"
        ]),
        .target(name: "Blog",
                dependencies: [
                    "WebView",
                ]),
        .target(name: "BlogLinks",
                dependencies: [
                    "WebView",
                ]),
        .target(name: "Build"),
        .target(
            name: "Home",
            dependencies: [
                "BlogLinks",
                "Build",
                .product(name: "FirebaseAuth", package: "Firebase", condition: .when(platforms: [.iOS]))
            ]),
        .target(name: "Sponsor",
                dependencies: [
                    "WebView",
                ]),
        .target(
            name: "TimeTable",
            dependencies: [
                "WebView",
            ]),
        .target(
            name: "Setting",
            dependencies: [
                "WebView",
            ]),

        .target(name: "WebView"),
        .testTarget(
            name: "HomeTest",
            dependencies: ["Home"]),
        .testTarget(
            name: "TimeTableTest",
            dependencies: ["TimeTable"]),
    ]
)
