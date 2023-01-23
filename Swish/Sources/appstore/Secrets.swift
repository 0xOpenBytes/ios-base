import Foundation

struct Secrets {
  let apploaderUsername: String
  let apploaderPassword: String
  let appleTeamID: String
  init() throws {
    guard let apploaderUsername = ProcessInfo.processInfo.environment["APPLOADER_USERNAME"],
      let apploaderPassword = ProcessInfo.processInfo.environment["APPLOADER_USERNAME"] else {
      throw Errors.missingApploaderCredentials
    }
    guard let teamID = ProcessInfo.processInfo.environment["APPLE_TEAM_ID"] else {
      throw Errors.missingTeamID
    }
    self.apploaderUsername = apploaderUsername
    self.apploaderPassword = apploaderPassword
    self.appleTeamID = teamID
  }

  enum Errors: Error {
    case missingApploaderCredentials
    case missingTeamID
  }
}
