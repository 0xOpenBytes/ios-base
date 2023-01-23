import XCTest

final class baseScreenshotTests: XCTestCase {

  var app: XCUIApplication!

  override func setUpWithError() throws {
    continueAfterFailure = false

    let app = XCUIApplication()
    app.launchEnvironment["SCREENSHOTS"] = "YES"
    app.launchArguments.append("enable-testing")
    app.launch()
    self.app = app
  }

  func testScreenshots() {
    takeScreenshot(named: "Home")
  }

  private func takeScreenshot(named name: String) {
    let screenshot = XCUIScreen.main.screenshot()
    let attachment = XCTAttachment(
      uniformTypeIdentifier: "public.png",
      name: "\(name).png",
      payload: screenshot.pngRepresentation)
    attachment.lifetime = .keepAlways
    add(attachment)
  }
}
