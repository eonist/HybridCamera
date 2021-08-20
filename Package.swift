// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "HybridCamera",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "HybridCamera",
            targets: ["HybridCamera"])
    ],
    dependencies: [
        .package(url: "https://github.com/eonist/ResultSugar.git", .branch("master")),
        .package(url: "https://github.com/eonist/ZoomSwitcherKit.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "HybridCamera",
            dependencies: ["ResultSugar", "ZoomSwitcherKit"]),
        .testTarget(
            name: "HybridCameraTests",
            dependencies: ["HybridCamera"])
    ]
)
