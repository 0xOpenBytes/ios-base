//
//  RootView.swift
//  TestProjectName
//
//  Created by Leif on 12/14/22.
//

import SwiftUI

struct RootView: View {
    enum Tab {
        case home
        case search
        case profile
    }

    @ObservedObject var navigation: Navigation

    var body: some View {
        TabView(selection: $navigation.tab) {
            CartographyView(path: navigation.home) {
                HomeScreen()
            }
            .tag(Tab.home)
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }

            CartographyView(path: navigation.search) {
                SearchScreen()
            }
            .tag(Tab.search)
            .tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }

            CartographyView(path: navigation.profile) {
                ProfileScreen()
            }
            .tag(Tab.profile)
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation.shared.use { navigation -> RootView in
            navigation.home = CartographyPath(id: "home.preview")
            navigation.search = CartographyPath(id: "search.preview")
            navigation.profile = CartographyPath(id: "profile.preview")

            return RootView(navigation: navigation)
        }
    }
}
