// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let sdkName = "KNSDK"
let version = "1.10.8"

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
        .package(url: "https://github.com/kakaomob/RealmSwift.git", branch: "main"),
    ],
    targets: getRealmFromNexus(),
    swiftLanguageVersions: [.v5]
)

func getRealmFromNexus() -> [Target] {
    let targets: [Target]  = [
        .binaryTarget(name: sdkName,
                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/1.10.8-beta.1/KNSDK/KNSDK.xcframework.zip",
                      checksum: "96b5b7184b6d250575ee1552a99f68b90dedab497bee5bb3ecc6d69a776a55ee"),
        .target(name: "KNSDKBundle",
                dependencies: [
                    .target(name: sdkName),
                    .product(name: "KMLocationSDK", package: "KMLocationSDK"),
                    .product(name: "RealmSwift", package: "RealmSwift"),
                ]
        )
    ]
    
#if swift(>=5.10)
    // 15.3
        return targets + [
//            .binaryTarget(name: "Realm",
//                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
//                          checksum: "87ea6d787b8296c0197ad47e2f76a873a2c54ea2226c786f78ba7ee62b581175"),
//            .binaryTarget(name: "RealmSwift",
//                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/15.3/RealmSwift.xcframework.zip",
//                          checksum: "bef383c42af99588928c9feb3ce54e3784e75e5a36ec428f744b1e821ab22f4d"),
            ]
    #elseif swift(>=5.9.2)
    // 15.2, 15.1
        return targets + [
//            .binaryTarget(name: "Realm",
//                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
//                          checksum: "87ea6d787b8296c0197ad47e2f76a873a2c54ea2226c786f78ba7ee62b581175"),
//            .binaryTarget(name: "RealmSwift",
//                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/15.2/RealmSwift.xcframework.zip",
//                          checksum: "5b375dee7abbdb23abd1247daf87c159a59d8e6f1d7ebbba6f7f8d82f77d470c"),
            ]
    #elseif swift(>=5.8.1)
    // 14.3.1
        return targets + [
//            .binaryTarget(name: "Realm",
//                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
//                          checksum: "87ea6d787b8296c0197ad47e2f76a873a2c54ea2226c786f78ba7ee62b581175"),
//            .binaryTarget(name: "RealmSwift",
//                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/14.3.1/RealmSwift.xcframework.zip",
//                          checksum: "1b52a9eaf7c1ddc98b32b39dcb2a88739896cf710fb56e5fa37c11e1073be4ac"),
            ]
    #elseif swift(>=5.7.2)
    // 14.2
        return targets + [
//            .binaryTarget(name: "Realm",
//                          url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/Realm/Realm.xcframework.zip",
//                      checksum: "87ea6d787b8296c0197ad47e2f76a873a2c54ea2226c786f78ba7ee62b581175"),
//        .binaryTarget(name: "RealmSwift",
//                      url: "https://devrepo.kakaomobility.com/repository/kakao-mobility-ios-knsdk-release/Realm/10.49.3/14.2/RealmSwift.xcframework.zip",
//                      checksum: "d9bef3a83929c4c91b61080c8b78ba891d68e3cfc56a62fe079eae692d495d6c"),
        ]
    #else
        return []
    #endif
}
