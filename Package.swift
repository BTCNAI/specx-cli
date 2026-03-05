// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "specx-cli",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(name: "specx", targets: ["SpecXCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.5.0")
    ],
    targets: [
        .executableTarget(
            name: "SpecXCLI",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "SpecXCLITests",
            dependencies: ["SpecXCLI"]
        )
    ]
)
