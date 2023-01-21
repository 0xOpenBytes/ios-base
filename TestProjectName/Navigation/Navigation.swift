//
//  Navigation.swift
//  TestProjectName
//
//  Created by Leif on 12/16/22.
//

import SwiftUI

public final class Navigation: ObservableObject {
    static var shared: Navigation = Navigation()

    var home: CartographyPath = CartographyPath.load(id: "home")
    var search: CartographyPath = CartographyPath.load(id: "search")
    var profile: CartographyPath = CartographyPath.load(id: "profile")

    var isPreview = false

    @Published var tab: RootView.Tab = .home

    static var path: CartographyPath {
        Navigation.shared.use { navigation in
            switch navigation.tab {
            case .home:     return navigation.home
            case .search:   return navigation.search
            case .profile:  return navigation.profile
            }
        }
    }

    private init() { }
}

extension Navigation: Usable { }
