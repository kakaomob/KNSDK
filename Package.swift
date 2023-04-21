// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkName = "KNSDK"
let version = "1.8.0"

let package = Package(
    name: sdkName,
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "KNSDK",
            targets: ["KNSDKBundle"])
    ],
    dependencies: [
        .package(url: "https://github.com/kakaomob/KMLocationSDK.git", exact: Version(stringLiteral: "1.3.20")),
    ],
    targets: [
        .binaryTarget(name: sdkName,
                      url: "https://admin-devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.8.0-beta.2/KNSDK/KNSDK.xcframework.zip",
                      checksum: "138d8268dd9b2efd69edb65ac2078722cc152bb89389943bca7094500d7ac99d"),
        .binaryTarget(name: "Realm",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.8.0-beta.1/Realm/Realm.xcframework.zip",
                      checksum: "38d347d80465ad936f3770c1a732db99cdf4673b6c75179757e02a8a0d95868d"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.8.0-beta.1/Realm/RealmSwift.xcframework.zip",
                      checksum: "cb8cafcd32ef80e55e3455f27d06dacb079c5c2fae4d8869737c4f291ffc0a41"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "KMLocationSDK", package: "KMLocationSDK"),
                    .target(name: "Realm"),
                    .target(name: "RealmSwift")
                ]
        )
    ],
    swiftLanguageVersions: [.v5]
)




