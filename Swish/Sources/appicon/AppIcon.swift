import AppIconLib

@main
struct AppIcon {
  static func main() async throws {
    let svgPath = "Swish/AppIcon.svg"
    try await XCAssets(inputSVG: svgPath, outputDir: "base").render()
  }
}
