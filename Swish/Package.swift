// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Scripts",
  platforms: [.macOS(.v12)],
  products: [
    .executable(name: "appstore", targets: ["appstore"]),
    .executable(name: "project", targets: ["project"])
  ],
  dependencies: [
    .package(url: "https://github.com/FullQueueDeveloper/Sh.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShGit.git", from: "1.0.0"),
    .package(url: "https://github.com/FullQueueDeveloper/ShXcrun.git", from: "0.1.9"),
  ],
  targets: [
    .executableTarget(
      name: "appstore",
      dependencies: ["Sh", "ShGit", "ShXcrun"]
    ),
    .executableTarget(
      name: "project",
      dependencies: ["Sh"]
    ),
  ]
)