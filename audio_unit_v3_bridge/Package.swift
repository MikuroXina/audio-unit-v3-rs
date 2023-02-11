// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "audio_unit_v3_bridge",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .library(
            name: "audio_unit_v3_bridge",
            type: .dynamic,
            targets: ["audio_unit_v3_bridge"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "audio_unit_v3_bridge",
            dependencies: []
        ),
        .testTarget(
            name: "audio_unit_v3_bridgeTests",
            dependencies: ["audio_unit_v3_bridge"]
        ),
    ]
)
