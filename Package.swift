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
        .package(url: "https://github.com/kakaomob/KMLocationSDK.git", exact: Version(stringLiteral: "1.3.17")),
    ],
    targets: [
        .binaryTarget(name: sdkName,
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.8.0-beta.1/KNSDK/KNSDK.xcframework.zip",
                      checksum: "87a27cf4e0ba6fb450465d279d18ace36e8fd7b373a2414de48a132fbed604e0"),
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




