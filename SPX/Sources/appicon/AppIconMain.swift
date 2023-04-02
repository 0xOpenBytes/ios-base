import SwishXCAssets

@main
struct AppIconMain {
  static func main() async throws {
    let svgPath = "Swish/AppIcon.svg"
    try await AppIcon(inputSVG: svgPath, outputDir: "base").render()
  }
}
