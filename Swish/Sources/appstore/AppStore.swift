import Foundation
import Sh
import ShXcrun
import ShGit
import Rainbow

@main
struct AppStore {
  static func main() {

    do {

      let git = Git()
      guard try git.isClean()
      else {
        throw Errors.gitRepoNotClean
      }

      let logRoot = "Swish/logs"
      let artifactRoot = "Swish/artifacts"
      try sh(.terminal, "mkdir -p \(logRoot)")
      try sh(.terminal, "mkdir -p \(artifactRoot)")

      try AppStore(secrets: Secrets(), logRoot: logRoot, artifactRoot: artifactRoot).build()

    } catch {
      print("error".red, error)
    }
  }

  enum Errors: Error {
    case gitRepoNotClean
  }

  let secrets: Secrets, logRoot: String, artifactRoot: String
  init(secrets: Secrets, logRoot: String, artifactRoot: String) {
    self.secrets = secrets
    self.logRoot = logRoot
    self.artifactRoot = artifactRoot
  }

  func build() throws {
    print("=== Build start ===".cyan)
    let archivePath = "\(artifactRoot)/base.xcarchive"
    let exportOptionsPath = "\(artifactRoot)/exportOptions.plist"
    let exportOptions = ExportOptions(compileBitcode: false,
                                      manageAppVersionAndBuildNumber: true,
                                      method: .appStore,
                                      teamID: secrets.appleTeamID,
                                      uploadBitcode: false,
                                      uploadSymbols: true)
    try exportOptions.write(to: exportOptionsPath)

    let xcodebuild = Xcodebuild(project: "base.xcodeproj",
                                scheme: "base",
                                sdk: "iphoneos",
                                allowProvisioningUpdates: true,
                                allowProvisioningDeviceRegistration: true)
    try xcodebuild.archive(.file("\(logRoot)/archive.log"), path: archivePath)
    try xcodebuild.exportArchive(.file("\(logRoot)/exportArchive.log"),
                                 archivePath: archivePath,
                                 exportPath: artifactRoot,
                                 exportOptionsPlistPath: exportOptionsPath)

    let altool = Altool(credential: .password(username: secrets.apploaderUsername, password: secrets.apploaderPassword))
    try altool.uploadApp(.file("\(logRoot)/upload.log"), file: "\(artifactRoot)/base.ipa", platform: .iOS)
    print("=== Build complete ===".green)
  }
}
