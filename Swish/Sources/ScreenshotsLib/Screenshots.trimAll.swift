import Foundation
import Sh

extension Screenshots {
  func trimAll() throws {
    try FileManager.default.createDirectory(atPath: "\(pngsPath)/\(Device.proMax.name)-trimmed/", withIntermediateDirectories: true)
    try FileManager.default
      .contentsOfDirectory(atPath: "\(pngsPath)/\(Device.proMax.name)")
      .forEach({ file in
        try trimOne(
          screenshotPath: "\(pngsPath)/\(Device.proMax.name)/\(file)",
          maskPath: "tmp/Screenshots/\(Device.proMax.name)-masked.png",
          outputPath: "\(pngsPath)/\(Device.proMax.name)-trimmed/\(file)")
      })
  }
}
