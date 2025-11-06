// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "ReveChatSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "ReveChatSDK",
            targets: ["ReveChatSDK"]
        )
    ],
    dependencies: [
        // WebRTC from GitHub
        //.package(url: "https://github.com/stasel/WebRTC.git", branch: "latest")
    ],
    targets: [
        // Prebuilt SDK XCFramework
        .binaryTarget(
            name: "ReveChatSDKBinary",
            path: "./XCFrameworks/ReveChatSDK.xcframework"
        ),

        // AFNetworking XCFramework shipped with SPM
        .binaryTarget(
            name: "AFNetworking",
            path: "./XCFrameworks/AFNetworking.xcframework"
        ),

        .binaryTarget(
            name: "WebRTC",
            path: "./XCFrameworks/WebRTC.xcframework"
        ),
        // Wrapper Target
        .target(
            name: "ReveChatSDK",
            dependencies: [
                "ReveChatSDKBinary",
                "AFNetworking",
                "WebRTC"
            ],
            path: "Sources/ReveChatSDK",
            publicHeadersPath: "include"
        )
    ]
)
