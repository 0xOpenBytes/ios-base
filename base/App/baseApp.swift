//
//  baseApp.swift
//  base
//
//  Created by Leif on 1/2/23.
//

import SwiftUI

@main
struct OBbaseApp: App {
    @ObservedObject var navigation: Navigation = Navigation.shared

    var body: some Scene {
        WindowGroup {
            RootView(navigation: navigation)
        }
    }
}
