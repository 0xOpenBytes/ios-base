import Sh

public struct Project {
  public init() {}
  public func generate() throws {
    try sh(.terminal, "xcodegen")
  }
}