// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "PrivateImage",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "PrivateImage",
            targets: ["PrivateImage"]),
    ],
    targets: [
        .target(
            name: "PrivateImage",
            dependencies: []
        ),
    ]
)
