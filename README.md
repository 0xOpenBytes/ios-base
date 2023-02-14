<div align="center">
  <img src="https://openbytes.dev/assets/projects/images/ios-base-icon.png" alt="Icon representing the OpenBytes iOS-base template project." width="35%"/>
  <h1>iOS-Base</h1>
  <h3>The OpenBytes template for iOS projects using SwiftUI</h3>
  <a href="https://github.com/0xOpenBytes/ios-base/blob/main/LICENSE">
    <img src="https://img.shields.io/badge/license-MIT-blue" alt="MIT License"/>
  </a>
  <img src="https://img.shields.io/github/v/release/0xOpenBytes/ios-base"/>
  <a href="https://discord.gg/HUmaDXVsW7">
    <img src="https://img.shields.io/discord/933406727150391376" alt="Community Chat"/>
  </a>
  <img src="https://img.shields.io/badge/iOS-16%2B-informational" alt="iOS Version"/>
</div>

## Project

### Structure

- base
  - App: SwiftUI App and Views
  - Data
    - Mock: Static mock data and json reading functionality.
    - Network: Network data models used in Services and Adapters.
    - Adapters: Objects that can convert from Network to Device or Device to Network models.
    - JSON: Network data model JSON files.
    - Device: Device data models used in SwiftUI Views and ViewModels. Device models should be created from Network models by using Adapters.
  - FileStorage: Local storage functionality.
  - Navigation: SwiftUI NavigationPath using an object called CartographyPath and CartographyView. There is also the ability to present toasts, alerts, modals, and action sheets using the CartographyPath.
  - Networking: Networking functionality.
  - Notifications: Local Notification functionality.
  - Persistence
    - Caching
      - Image: Memory storage for Images, used in ImageView.
      - Data: Memory storage for anything conforming to DataCaching.
  - Preview Content
  - Settings: Shared app data and state.
  - Utilities: Miscellaneous app utilities.
- baseTests
  - Adapters: Test Network to Device and Device to Network transformations.
  - Persistence: Tests for Persistence and Caching.
  - UserRegistration: Tests for register using ViewModels and DI.
  - Validation: Tests for different types of data validation.

### Dependency List

- [OpenBytes o](https://github.com/0xOpenBytes/o) <img src="https://img.shields.io/github/v/release/0xOpenBytes/o"/>
  - Allows us to get the input and set the output of file, url, the console, and UserNotifications.
- [OpenBytes c](https://github.com/0xOpenBytes/c) <img src="https://img.shields.io/github/v/release/0xOpenBytes/c"/>
  - Allows us to transform types from one to another while also providing us the various caching options.
- [Fork](https://github.com/0xLeif/Fork) <img src="https://img.shields.io/github/v/release/0xLeif/Fork"/>
  - Fork allows us to run multiple asynchronous tasks at the same time.

## Getting Started

### Installing development dependencies

1. Install [Homebrew](https://brew.sh)
2. Run `brew bundle`

Learn more about [Swish](https://www.github.com/FullQueueDeveloper/Swish) and [Xcodegen](https://github.com/yonaskolb/XcodeGen)

### Renaming

There are some scripts to help rename base to whatever project name you want.

- Clone the templated repository
- run `./rename.sh`
- Enter a project name

## Continuing onward

### Regenerate the project

    swish xcodeproj

### Pushing to the App Store

This script expects `APPLE_TEAM_ID`, `APPLOADER_USERNAME` and `APPLOADER_PASSWORD` to be present in the environment.

It doesn't have to stay that way. Modify `Swish/Sources/appstore/Secrets.swift` to use an API key, or perhaps fetch credentials from a password manager like 1Password using [Sh1Password](https://github.com/FullQueueDeveloper/Sh1Password).

When that's settled, you can run

    swish appstore
