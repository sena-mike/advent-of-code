// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "advent-of-code",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/apple/swift-algorithms", from: "0.0.1"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "advent-of-code",
            dependencies: [
            .product(name: "Algorithms", package: "swift-algorithms")
            ]),
        .testTarget(
            name: "advent-of-codeTests",
            dependencies: ["advent-of-code"]),
    ]
)
