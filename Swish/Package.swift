// swift-tools-version:5.7

import PackageDescription

let package = Package(
  name: "Scripts",
  platforms: [.macOS(.v12)],
  products: [
    .executable(name: "appstore", targets: ["AppStore"]),
    .executable(name: "generate", targets: ["generate"]),
  ],
  dependencies: [
    .package(url: "https://github.com/FullQueueDeveloper/Sh.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShGit.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShXcrun.git", from: "0.1.9"),
  ],
  targets: [
    .target(name: "AppStoreLib",
            dependencies: ["Sh", "ShGit", "ShXcrun"]),
    .target(name: "ProjectLib",
            dependencies: ["Sh"]),
    .executableTarget(name: "AppStore",
                      dependencies: ["AppStoreLib"]),
    .executableTarget(name: "generate",
                      dependencies: ["ProjectLib"]),
  ]
)
