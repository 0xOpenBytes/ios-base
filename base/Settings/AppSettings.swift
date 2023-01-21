//
//  AppSettings.swift
//  base
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

class AppSettings: ObservableObject {
    static let shared = AppSettings()

    @Published var user: User?

    private init() {}
}
