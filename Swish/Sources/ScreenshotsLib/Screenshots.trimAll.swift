import Foundation
import Sh

extension Screenshots {
  func trimAll(device: Device) throws {
    try FileManager.default.createDirectory(atPath: "\(pngsPath)/\(device.name)-trimmed/", withIntermediateDirectories: true)
    try FileManager.default
      .contentsOfDirectory(atPath: "\(pngsPath)/\(device.name)")
      .forEach({ file in
        try trimOne(
          screenshotPath: "\(pngsPath)/\(device.name)/\(file)",
          maskPath: "\(masksPath)/\(device.name)-masked.png",
          outputPath: "\(pngsPath)/\(device.name)-trimmed/\(file)")
      })
  }
}
