// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkCocoaMQTT",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(name: "NetworkCocoaMQTT", targets: [ "NetworkCocoaMQTT" ]),
        .library(name: "CocoaMQTTWebSocket", targets: [ "CocoaMQTTWebSocket" ])
    ],
    targets: [
        .target(name: "NetworkCocoaMQTT",
                path: "Source",
                exclude: ["CocoaMQTTWebSocket.swift"],
                swiftSettings: [ .define("IS_SWIFT_PACKAGE")]),
        .target(name: "CocoaMQTTWebSocket",
                dependencies: [ "NetworkCocoaMQTT" ],
                path: "Source",
                sources: ["CocoaMQTTWebSocket.swift"],
                swiftSettings: [ .define("IS_SWIFT_PACKAGE")]),
        .testTarget(name: "CocoaMQTTTests",
                    dependencies: [ "NetworkCocoaMQTT", "CocoaMQTTWebSocket" ],
                    path: "CocoaMQTTTests",
                    swiftSettings: [ .define("IS_SWIFT_PACKAGE")])
    ]
)
