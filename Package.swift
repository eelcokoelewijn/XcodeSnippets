// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XcodeSnippets",
    products: [
        .executable(name: "snippets", targets: ["Snippets"]),
        .library(name: "XcodeSnippets", targets: ["XcodeSnippets"])
    ],
    dependencies: [
        .package(url: "https://github.com/eelcokoelewijn/FileKit", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.35.8")
    ],
    targets: [
        .executableTarget(name: "Snippets", dependencies: ["XcodeSnippets"]),
        .target(name: "XcodeSnippets", dependencies: ["FileKit", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(name: "XcodeSnippetsTests", dependencies: ["XcodeSnippets"])
    ]
)
