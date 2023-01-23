// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "Scripts",
  platforms: [.macOS(.v12)],
  products: [
    .executable(name: "appstore", targets: ["appstore"]),
    .executable(name: "generate", targets: ["generate"]),
    .executable(name: "screenshots", targets: ["screenshots"]),

  ],
  dependencies: [
    .package(url: "https://github.com/FullQueueDeveloper/Sh.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShGit.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShXcrun.git", from: "0.1.9"),
  ],
  targets: [
    .executableTarget(name: "appstore",
                      dependencies: ["AppStoreLib"]),
    .target(name: "AppStoreLib",
            dependencies: ["Sh", "ShGit", "ShXcrun"]),
    .executableTarget(name: "generate",
                      dependencies: ["ProjectLib"]),
    .target(name: "ProjectLib",
            dependencies: ["Sh"]),
    .executableTarget(name: "screenshots",
                      dependencies: ["ScreenshotsLib"]),
    .target(name: "ScreenshotsLib",
            dependencies: ["Sh"]),
  ]
)
