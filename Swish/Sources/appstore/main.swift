import SwishAppStore
import Foundation

guard let appleTeamID =
        ProcessInfo.processInfo.environment["APPLE_TEAM_ID"],
      let apploaderUsername =
        ProcessInfo.processInfo.environment["APPLOADER_USERNAME"],
      let apploaderPassword =
        ProcessInfo.processInfo.environment["APPLOADER_PASSWORD"]
else {
  fatalError("Missing some secrets, `APPLE_TEAM_ID`, `APPLOADER_USERNAME`, and `APPLOADER_PASSWORD`. Either add these to your environment or modify this script to provide these values in a different way.")
}

let appStore = try AppStore(project: "base.xcodeproj",
                            scheme: "base")
try appStore.build(appleTeamID: appleTeamID)
try appStore.upload(credential:
                      LiteralPasswordCredential(
                        username: apploaderUsername,
                        password: apploaderPassword))
