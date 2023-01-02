//
//  RootView.swift
//  base
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

    @ObservedObject var cartography: CartographyPath

    @State private var selection: Tab = .home

    var body: some View {
        CartographyView(path: cartography) {
            TabView(selection: $selection) {
                HomeScreen()
                    .tag(Tab.home)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }

                SearchScreen()
                    .tag(Tab.search)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }

                ProfileScreen()
                    .tag(Tab.profile)
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                    }
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Navigation.use { nav -> RootView in
            nav.isPreview = true
            nav.path = CartographyPath()

            return RootView(cartography: Navigation.path)
        }
    }
}
