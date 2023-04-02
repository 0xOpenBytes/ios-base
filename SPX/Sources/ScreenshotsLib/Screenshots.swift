import Sh
import Foundation

public struct Screenshots {
  let logsPath: String
  let derivedDataPath: String
  let pngsPath: String
  let masksPath: String
  
  let project: String?, workspace: String?, scheme: String
  
  let width = 1284
  let height = 2778
  
  public init(logsPath: String = "Swish/Screenshots/Logs", derivedDataPath: String = "Swish/Screenshots/DerivedData", pngsPath: String = "Swish/Screenshots/PNGs", masksPath: String = "Swish/Screenshots/Masks", project: String? = nil, workspace: String? = nil, scheme: String) {
    self.logsPath = logsPath
    self.derivedDataPath = derivedDataPath
    self.pngsPath = pngsPath
    self.masksPath = masksPath
    
    self.project = project
    self.workspace = workspace
    self.scheme = scheme
  }

  public func go() throws {
    try clearDirectories()
    try take()
    
    try applyMask(for: .proMax)
  }
  
  func applyMask(for device: Device) throws {
    try device.createMask(at: masksPath)
    try trimAll(device: device)
  }
  
  private func clearDirectories() throws {
    try sh(.terminal, "rm -fr \(derivedDataPath) \(pngsPath) \(logsPath) \(masksPath)")
        
    try FileManager.default.createDirectory(atPath: logsPath, withIntermediateDirectories: true)
    try FileManager.default.createDirectory(atPath: derivedDataPath, withIntermediateDirectories: true)
    try FileManager.default.createDirectory(atPath: pngsPath, withIntermediateDirectories: true)
    try FileManager.default.createDirectory(atPath: masksPath, withIntermediateDirectories: true)
  }
}
