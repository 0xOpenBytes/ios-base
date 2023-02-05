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
    .package(url: "https://github.com/FullQueueDeveloper/ShXcrun.git", from: "0.1.9"),
    .package(url: "https://github.com/FullQueueDeveloper/CreateXCAssets.git", from: "0.1.0"),
    .package(url: "https://github.com/0xLeif/Fork.git", from: "1.0.0"),
    .package(url: "https://github.com/swhitty/SwiftDraw.git", from: "0.13.3"),
  ],
  targets: [
    .executableTarget(name: "appicon",
      dependencies: ["CreateXCAssets"]),

    .executableTarget(name: "appstore",
                      dependencies: ["AppStoreLib"]),
    .target(name: "AppStoreLib",
            dependencies: ["Sh", "ShGit", "ShXcrun"]),
    .executableTarget(name: "xcodeproj",
                      dependencies: ["ProjectLib"]),
    .target(name: "ProjectLib",
            dependencies: ["Sh"]),
    .executableTarget(name: "screenshots",
                      dependencies: ["ScreenshotsLib"]),
    .target(name: "ScreenshotsLib",
            dependencies: ["Sh"]),
  ]
)
