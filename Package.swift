// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let sdkName = "KNSDK"
let version = "1.9.6"

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
        .package(url: "https://github.com/kakaomob/KMLocationSDK.git", exact: Version(stringLiteral: "1.103.62")),
    ],
    targets: getRealmFromNexus(),
    swiftLanguageVersions: [.v5]
)

func getRealmFromNexus() -> [Target] {
    let targets: [Target]  = [
        .binaryTarget(name: sdkName,
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.9.6/KNSDK/KNSDK.xcframework.zip",
                      checksum: "cc9ff692c145cdb5febd91e50be99614f091c60d9ef48bfd6b3bd09e64cdc526"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "KMLocationSDK", package: "KMLocationSDK"),
                    .target(name: "Realm"),
                    .target(name: "RealmSwift")
                ]
        )
    ]
    
    #if swift(>=5.8)
    // 14.3
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.38.3/14.3/Realm.xcframework.zip",
                          checksum: "1fdf7bd87ac1960a95b8172e3d526a7114ec34196b5c2799786034de96eb979c"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.38.3/14.3/RealmSwift.xcframework.zip",
                          checksum: "a39e778c6253257ed678240ae239c7b755724b279aea626450cd633f135c25ec"),
            ]
    #elseif swift(>=5.7.2)
    // 14.2
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.38.3/14.2/Realm.xcframework.zip",
                          checksum: "491d60ce303b9b8ac014acbe56abda62b31c1eb5acb8e7d2f74b5869dc7324f7"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.38.3/14.2/RealmSwift.xcframework.zip",
                          checksum: "11077d3a13fa89cbe17f745345c3f3016f09e023246a6fe016cc8d85b2fb085d"),
            ]
    #elseif swift(>=5.7.1)
    // 14.1
        return targets + [
            .binaryTarget(name: "Realm",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.38.3/14.1/Realm.xcframework.zip",
                          checksum: "3b837edee8f3b2e7a647d1339a2a2db5492ecb0ca6c039b4be65699aa147590a"),
            .binaryTarget(name: "RealmSwift",
                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.38.3/14.1/RealmSwift.xcframework.zip",
                          checksum: "af548986a5d0e1f45a142a1db4df426f8acb1377d067e92b2fb4a282169950f5"),
            ]
    #else
        return []
    #endif
}
