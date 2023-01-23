import Foundation

enum Device: CaseIterable  {
  case proMax
  case plus

  var simulatorName: String {
    switch self {
    case .proMax:
      return "iPhone 14 Pro Max"
    case .plus:
      return "iPhone 8 Plus"
    }
  }

  var name: String {
    switch self {
    case .proMax:
      return "ProMax"
    case .plus:
      return "Plus"
    }
  }
}
