//
//  HomeScreen.swift
//  base
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var settings: AppSettings = AppSettings.shared

    var body: some View {
        VStack {
            ImageView(
                url: URL(string: "https://avatars.githubusercontent.com/u/92551192?s=200&v=4"),
                content: { image in
                    image
                        .resizable()
                        .frame(width: 120, height: 120)
                        .padding()
                },
                placeholder: {
                    ProgressView()
                        .foregroundColor(.accentColor)
                        .frame(width: 120, height: 120)
                        .padding()
                }
            )
        }
        .navigationTitle("Hello, \(settings.user?.username ?? "World")!")
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
