import Foundation
import Fork
import Sh
import SwiftDraw
import AppKit

public struct AppIcon {
  
  let inputSVG: String, outputDir: String
  public init(inputSVG: String, outputDir: String) {
    self.inputSVG = inputSVG
    self.outputDir = outputDir
  }
  
  public func render() async throws {
    try FileManager.default.createDirectory(atPath: "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset", withIntermediateDirectories: true)
    
    
    guard let svg = SVG(fileURL: URL(fileURLWithPath: inputSVG)) else {
      fatalError("could not load app icon from path: \(inputSVG)")
    }
    
    try await AppIcon.Size.allCases.asyncForEach { size in
      let pngPath = "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset/\(filename(for: size))"

      
      guard let pngData = svg.rasterize(with: size.cgSize, scale: size.data.scale.cgFloat).pngData else {
        fatalError("could not render app icon at size: seize")
      }
      try pngData.write(to: URL(fileURLWithPath: pngPath))
    }
    
    try XCAssetsJSON.xcassetsContents.data(using: .utf8)!.write(to: URL(fileURLWithPath: "\(outputDir)/AppIcon.xcassets/Contents.json"))
    try XCAssetsJSON.appiconsetContents.data(using: .utf8)!.write(to: URL(fileURLWithPath: "\(outputDir)/AppIcon.xcassets/AppIcon.appiconset/Contents.json"))
  }
  
  func filename(for size: AppIcon.Size) -> String {
    switch size.data.scale {
    case .one:
      return "AppIcon-\(size.data.pixelWidth).png"
    case .two, .three:
      return "AppIcon-\(size.data.pixelWidth)-\(size.data.baseWidth)\(size.data.scale.fileLabel).png"
    }
  }
}

extension NSImage {
  var pngData: Data? {
    guard let tiffRepresentation = tiffRepresentation, let bitmapImage = NSBitmapImageRep(data: tiffRepresentation) else { return nil }
    return bitmapImage.representation(using: .png, properties: [:])
  }
}
