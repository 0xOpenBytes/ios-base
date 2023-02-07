import SwishAppStore
import Foundation


let logRoot = "Swish/logs"
let artifactRoot = "Swish/artifacts"


let secrets = AppStore.Secrets(
  appleTeamID: ProcessInfo.processInfo.environment["APPLE_TEAM_ID"],
  apploaderUsername: ProcessInfo.processInfo.environment["APPLOADER_USERNAME"],
  apploaderPassword: ProcessInfo.processInfo.environment["APPLOADER_USERNAME"])

let appStore = try AppStore(secrets:secrets, logRoot: logRoot, artifactRoot: artifactRoot)
try appStore.build(project: "base.xcodeproj", scheme: "base")
