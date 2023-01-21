//
//  ProfileScreen.swift
//  TestProjectName
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
                        registerNetworking: SuccessMockRegisterService() // TODO: (TestProjectName-Template) Update to Production
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
