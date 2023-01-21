//
//  TestProjectNameApp.swift
//  TestProjectName
//
//  Created by Leif on 1/2/23.
//

import SwiftUI

@main
struct OBTestProjectNameApp: App {
    @ObservedObject var navigation: Navigation = Navigation.shared

    var body: some Scene {
        WindowGroup {
            RootView(navigation: navigation)
        }
    }
}
