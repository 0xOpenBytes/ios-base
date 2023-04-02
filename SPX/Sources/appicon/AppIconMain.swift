import SwishXCAssets

@main
struct AppIconMain {
  static func main() async throws {
    let svgPath = "SPX/AppIcon.svg"
    try await AppIcon(inputSVG: svgPath, outputDir: "base").render()
  }
}
