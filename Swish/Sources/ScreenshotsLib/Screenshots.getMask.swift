import Sh

extension Screenshots {
  func getMask() throws {
    try sh(.terminal, "xcrun simctl bootstatus '\(Device.proMax.simulatorName)' -b")
    try sh(.terminal, "xcrun simctl io '\(Device.proMax.simulatorName)' screenshot \(masksPath)/\(Device.proMax.name)-masked.png --type png --mask alpha")
    try sh(.terminal, "xcrun simctl shutdown '\(Device.proMax.simulatorName)'")
  }
}
