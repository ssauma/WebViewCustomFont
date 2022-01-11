// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WebViewCustomFont",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(name: "WebViewCustomFont", targets: ["WebViewCustomFont"])
    ],
    targets: [
        .target(name: "WebViewCustomFont", path: "WebViewCustomFont/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
