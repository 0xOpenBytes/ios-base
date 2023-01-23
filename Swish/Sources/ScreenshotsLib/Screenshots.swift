import Sh

public struct Screenshots {
  let logsPath: String
  let derivedDataPath: String
  let pngsPath: String
  let masksPath: String
  
  let width = 1284
  let height = 2778

  public init(logsPath: String, derivedDataPath: String, pngsPath: String, masksPath: String) {
    self.logsPath = logsPath
    self.derivedDataPath = derivedDataPath
    self.pngsPath = pngsPath
    self.masksPath = masksPath
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
  }
}
