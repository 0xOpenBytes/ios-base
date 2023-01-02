//
//  baseApp.swift
//  base
//
//  Created by Leif on 1/2/23.
//

import SwiftUI

@main
struct OBbaseApp: App {
    let navigate: CartographyPath = Navigation.path

    var body: some Scene {
        WindowGroup {
            RootView(cartography: navigate)
        }
    }
}
