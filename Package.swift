// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkName = "KNSDK"
let version = "1.6.7"

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
        .package(url: "https://github.com/kakaomob/KMLocationSDK.git", exact: Version(stringLiteral: "1.2.23")),
    ],
    targets: [
        .binaryTarget(name: sdkName,
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/\(version)/KNSDK/KNSDK.xcframework.zip",
                      checksum: "c03c82ad256f2cfe8558238bb7864f44a9af696c2501fbeccab744dd23a75f35"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "LocationFramework", package: "KMLocationSDK")
                ]
        )
    ],
    swiftLanguageVersions: [.v5]
)




