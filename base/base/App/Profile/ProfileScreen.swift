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
            LoginScreen(
                registerViewModel: RegisterViewModel(
                    registerNetworking: SuccessMockRegisterService() // TODO: (base-Template) Update to Production
                )
            )
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
