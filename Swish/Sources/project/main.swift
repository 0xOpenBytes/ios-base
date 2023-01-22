import Sh
import Foundation

// generate the Xcode project

try sh(.terminal, "xcodegen")
