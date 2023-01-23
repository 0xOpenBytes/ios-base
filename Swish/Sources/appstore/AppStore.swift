import Foundation
import Sh
import ShXcrun
import Rainbow

struct AppStore {

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
