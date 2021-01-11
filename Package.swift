// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SlamTaskSpellBook",
    platforms: [.macOS(.v10_15)],
    products: [
        .library(
            name: "SlamTaskSpellBook",
            targets: ["SlamTaskSpellBook"]),
    ],
    dependencies: [
        .package(url: "https://github.com/magesteve/CocoaSpellBook.git", from: "0.0.2"),
    ],
    targets: [
        .target(
            name: "SlamTaskSpellBook",
            dependencies: ["CocoaSpellBook"]),
        .testTarget(
            name: "SlamTaskSpellBookTests",
            dependencies: ["CocoaSpellBook","SlamTaskSpellBook"]),
    ]
)
