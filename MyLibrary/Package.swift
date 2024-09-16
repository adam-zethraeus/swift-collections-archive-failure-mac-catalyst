// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MyLibrary",
    platforms: [.iOS(.v17), .macCatalyst(.v17), .macOS(.v14), .driverKit(.v22), .tvOS(.v17), .visionOS(.v1), .watchOS(.v10)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "MyLibrary",
            targets: ["MyLibrary", "MyLibrary2", "MyLibrary3"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections", from: "1.0.3"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.13.0"),
//        .package(url: "https://github.com/SwiftyLab/MetaCodable", from: "1.3.0"),
        .package(path: "../MetaCodable")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MyLibrary",
            dependencies: [
                "MetaCodable"
            ]
        ),
        .target(
            name: "MyLibrary2",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ]
        ),
        .target(
            name: "MyLibrary3",
            dependencies: [
                .product(name: "OrderedCollections", package: "swift-collections")
            ]
        ),
        .testTarget(
            name: "MyLibraryTests",
            dependencies: ["MyLibrary"]
        ),
    ]
)
