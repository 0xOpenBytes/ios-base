import Foundation
import CoreGraphics
import AVFoundation

extension CGImage {

  static func load(path: String) -> CGImage? {
    guard
      let source = CGImageSourceCreateWithURL(URL(fileURLWithPath: path) as CFURL, nil),
      let image = CGImageSourceCreateImageAtIndex(source, 0, nil) else {

      return nil
    }
    return image
  }
}
