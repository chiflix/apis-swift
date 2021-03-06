// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "apis",
    platforms: [
      // We can't use `.watchOS(.v6)` since it isn't available with `swift-tools-version:5.0`.
      .macOS(.v10_12), .iOS(.v10), .tvOS(.v10), .watchOS("6.0")
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "SagiAPI", targets: ["SagiAPI"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/grpc/grpc-swift.git", .revision("5f40a43567495b534dd445e6dd60181dff5a28d6")),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SagiAPI",
            dependencies: [
                "GRPC",
                "SwiftProtobuf"
            ],
            path: "Sources/apis"
        ),
        .testTarget(
            name: "apisTests",
            dependencies: [
                "GRPC",
                "SagiAPI"
            ]
        )
    ]
)
