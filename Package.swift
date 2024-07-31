// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let sdkName = "KNSDK"
let version = "1.10.9"

let package = Package(
    name: sdkName,
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "KNSDK",
            targets: ["KNSDKBundle"])
    ],
    dependencies: [
        .package(url: "https://github.com/kakaomob/KMLocationSDK.git", exact: Version(stringLiteral: "1.103.82")),
    ],
    targets: getRealmFromNexus(),
    swiftLanguageVersions: [.v5]
)

func getRealmFromNexus() -> [Target] {
    let targets: [Target]  = [
        .binaryTarget(name: sdkName,
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.10.9-dev.2/KNSDK/KNSDK.xcframework.zip",
                      checksum: "515f87da55f0181569dbb52ccfbb992c51aba583a4f32f906af66cb2351fa9a6"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "KMLocationSDK", package: "KMLocationSDK"),
                    .target(name: "Realm"),
                    .target(name: "RealmSwift")
                ],
                resources: [
                    .process("PrivacyInfo.xcprivacy")
                ]
        )
    ]
    
#if swift(>=5.10)
    // 15.3
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                          checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/15.3/RealmSwift.xcframework.zip",
                          checksum: "5a16f2bc01ae6393d213529c3abfb8d3c5212e6286e86367b3e5a6cdb6f5a3bb"),
            ]
    #elseif swift(>=5.9.2)
    // 15.2, 15.1
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                          checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/15.2/RealmSwift.xcframework.zip",
                          checksum: "04e554618d2bb8db1a0cb0f68d50849e0a43285be36e781abd03d3efa3586e58"),
            ]
    #elseif swift(>=5.8.1)
    // 14.3.1
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                          checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/14.3.1/RealmSwift.xcframework.zip",
                          checksum: "67e8e0f991bf079f4831007bd1f6cc96a7c11a07c4d7dec353d91ea9fc00f09b"),
            ]
    #elseif swift(>=5.7.2)
    // 14.2
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
                      checksum: "cd57ba67b49b4200385b2a5aaa57991e52c20f961bfe4082eadfc94c9c8d80c6"),
        .binaryTarget(name: "RealmSwift",
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/14.2/RealmSwift.xcframework.zip",
                      checksum: "19b8fc09ef27beceb2a6dccb690aa149be34c9328c962e423f7c667884a2caaf"),
        ]
    #else
        return []
    #endif
}
