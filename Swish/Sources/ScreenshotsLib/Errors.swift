import Foundation

enum Errors: Error {
  case readingScreenshotImage
  case readingMaskImage
  case creatingContext
  case makeImage
  case creatingDestination
  case finalizingDestination
}
