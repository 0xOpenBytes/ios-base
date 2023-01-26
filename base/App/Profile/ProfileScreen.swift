//
//  ProfileScreen.swift
//  base
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

struct ProfileScreen: View {
    @ObservedObject var settings: AppSettings = AppSettings.shared

    var body: some View {
        Group {
            if let user = settings.user {
                VStack {
                    Text("Logged in: \(user.username)")

                    Button(
                        "Logout",
                        role: .destructive,
                        action: { settings.user = nil }
                    )
                }
            } else {
                RegisterScreen(
                    registerViewModel: RegisterViewModel(
                        // TODO: (base-Template) Update to Production
                        registerNetworking: SuccessMockRegisterService()
                    )
                )
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
