// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

// see https://forums.swift.org/t/package-dependency-in-own-package/64587/2
// see: http://www.openradar.appspot.com/FB7654249

import PackageDescription

let package = Package(
  name: "MyLibrary",
  platforms: [
    .macOS(.v10_15)
  ],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "MyLibrary",
      targets: ["MyLibrary"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/example-package-figlet", branch: "main"),
    // .package(url: "https://github.com/vapor/postgres-nio.git", from: "1.14.0"),
    .package(url: "https://github.com/vapor/postgres-kit.git", from: "2.12.2"),
  ],
  targets: [
    // Targets are the basic building blocks of a package, defining a module or a test suite.
    // Targets can depend on other targets in this package and products from dependencies.
    .target(
      name: "MyLibrary",
      dependencies: [
        .product(name: "Figlet", package: "example-package-figlet"),
        .product(name: "PostgresKit", package: "postgres-kit"),
      ]
    ),
    .testTarget(
      name: "MyLibraryTests",
      dependencies: ["MyLibrary"]),
  ]
)
