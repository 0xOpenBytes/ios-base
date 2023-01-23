import Sh
import Foundation

extension Screenshots {
  func take() throws {
    try FileManager.default.createDirectory(atPath: derivedDataPath, withIntermediateDirectories: true)
    try FileManager.default.createDirectory(atPath: logsPath, withIntermediateDirectories: true)

    try Device.allCases.forEach { device in
      try sh(.file(logsPath + "/\(device.name).build.log"), """
        xcodebuild -project base.xcodeproj -scheme Screenshots -destination 'platform=iOS Simulator,name=\(device.simulatorName)' -derivedDataPath "\(derivedDataPath)" test
        """)

      let xcresultPath = try findLatestXCResult(in: derivedDataPath)
      try FileManager.default.createDirectory(atPath: "\(pngsPath)/\(device.name)", withIntermediateDirectories: true)
      try sh(.terminal, "xcparse screenshots \(xcresultPath) \(pngsPath)/\(device.name)")
    }
  }

  private func findLatestXCResult(in derivedDataPath: String) throws -> String {
    let testLogsPath = derivedDataPath + "/Logs/Test"
    let files = try FileManager.default.contentsOfDirectory(atPath: testLogsPath)
    let latest = files
      .filter({ $0.hasSuffix("xcresult")})
      .max()

    if let latest = latest {
      return testLogsPath + "/" + latest
    } else {
      enum XCResultError: Error {
        case latestNotFound
      }
      throw XCResultError.latestNotFound
    }
  }

}
