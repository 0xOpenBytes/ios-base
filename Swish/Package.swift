// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "Scripts",
  platforms: [.macOS(.v12)],
  products: [
    .executable(name: "appicon", targets: ["appicon"]),
    .executable(name: "appstore", targets: ["appstore"]),
    .executable(name: "screenshots", targets: ["screenshots"]),
    .executable(name: "xcodeproj", targets: ["xcodeproj"]),
  ],
  dependencies: [
    .package(url: "https://github.com/FullQueueDeveloper/Sh.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShGit.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/SwishXCAssets.git", from: "0.2.0"),
    .package(url: "https://github.com/FullQueueDeveloper/SwishAppStore.git", from: "0.2.0"),
    .package(url: "https://github.com/swhitty/SwiftDraw.git", from: "0.13.3"),
    .package(url: "https://github.com/0xOpenBytes/o", from: "2.0.0")
  ],
  targets: [
    .executableTarget(name: "appicon",
      dependencies: ["SwishXCAssets"]),

    .executableTarget(name: "appstore",
                      dependencies: ["SwishAppStore"]),
    .executableTarget(name: "xcodeproj",
                      dependencies: ["ProjectLib"]),
    .target(name: "ProjectLib",
            dependencies: ["Sh", "o"]),
    .executableTarget(name: "screenshots",
                      dependencies: ["ScreenshotsLib"]),
    .target(name: "ScreenshotsLib",
            dependencies: ["Sh"]),
  ]
)
