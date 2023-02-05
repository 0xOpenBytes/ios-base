//
//  base template generated by OpenBytes on 12/14/22.
//  Copyright (c) 2023 OpenBytes
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the conditions found at the following link:
//  https://github.com/0xOpenBytes/ios-BASE/blob/main/LICENSE
//
// Created by Leif.
//  RootView.swift
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
