//
//  RegisterScreen.swift
//  TestProjectName
//
//  Created by Rob Maltese on 12/18/22.
//

import SwiftUI

struct RegisterScreen: View {
    @ObservedObject var registerViewModel: RegisterViewModel

    @FocusState var isFocused: Bool

    init(
        registerViewModel: RegisterViewModel = RegisterViewModel(
            registerNetworking: ProductionRegisterService()
        )
    ) {
        self.registerViewModel = registerViewModel
        self.isFocused = false
    }

    var body: some View {
        VStack {
            Spacer()

            RegisterFields(
                username: $registerViewModel.username,
                email: $registerViewModel.email,
                password: $registerViewModel.password,
                passwordConfirmation: $registerViewModel.confirmationPassword,
                focused: _isFocused
            )
            .padding(.horizontal, 6)

            Button(
                action: {
                    registerViewModel.registerUser()
                },
                label: {
                    Text("Register")
                        .padding(.vertical)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .foregroundColor(registerViewModel.areFieldsValidated ? Color.gray : Color.blue)
                        )
                        .padding([.horizontal, .top])
                }
            )
            .disabled(registerViewModel.areFieldsValidated)

            Spacer()
        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen(
            registerViewModel: RegisterViewModel(
                registerNetworking: SuccessMockRegisterService()
            )
        )
    }
}
