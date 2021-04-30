// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "HUD",
    platforms: [.iOS(.v13)],
    products: [.library(name: "HUD", targets: ["HUD"])],
    targets: [.target(name: "HUD")]
)
