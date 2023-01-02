# ios-base

The OpenBytes template for iOS projects using SwiftUI

## Project

### Structure
- base
    - App: SwiftUI App and Views
    - Data
        - Mock
        - Network
        - Adapters
        - JSON
        - Device
    - FileStorage
    - Navigation
        - Interface
        - Implementation
    - Networking
        - Interface
        - Implementation
    - Notifications
    - Persistence
        - Caching
            - Image
            - Data
    - Preview Content
    - Settings
    - Utilities
- baseTests
    - Adapters
    - Persistence
    - UserRegistration
    - Validation

### Dependency List
- [OpenBytes o](https://github.com/0xOpenBytes/o)
  - Allows us to get the input and set the output of file, url, the console, and UserNotifications.
- [OpenBytes c](https://github.com/0xOpenBytes/c)
  - Allows us to transform types from one to another while also providing us the various caching options.
- [Fork](https://github.com/0xLeif/Fork)
  - Fork allows us to run multiple asynchronous tasks at the same time.
