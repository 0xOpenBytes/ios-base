//
//  RegisterViewModel.swift
//  base
//
//  Created by Rob Maltese on 12/21/22.
//

import Foundation

/**
 The `RegisterViewModel` conforms to type `ObservableObject`,
 and acts as mediator between the view and the networking layer.
 */
class RegisterViewModel: ObservableObject {
    private var registerNetworking: RegisterNetworking
    private var registerTask: Task<Void, Never>?

    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmationPassword = ""

    init(registerNetworking: RegisterNetworking) {
        self.registerNetworking = registerNetworking
    }

    var areFieldsValidated: Bool {
        email.isEmpty || password.isEmpty
    }

    /**
     Triggered by the `RegisterScreen` views submit button,
     and sends the required parameters to the network layer function.
     Upon returning successfully, it assigns the return to the `AppSettings.shared.user`.

     - Returns: `Task<Void, Never>` which is an asynchronous task that will run without returning any value, and will not fail with any error.

     By marking this function `@discardableResult`, it simply hides the warning from the compiler when not using returned values.
     */
    @discardableResult
    func registerUser() -> Task<Void, Never> {
        let task = Task {
            do {
                let user = try await registerNetworking.register(
                    username: username,
                    email: email,
                    password: password,
                    passwordConfirmation: confirmationPassword
                )

                await MainActor.run {
                    AppSettings.shared.user = user
                }

                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    Navigation.path.toast(
                        title: "Success",
                        message: "You have successfully registered an account.",
                        style: .success
                    )
                }
            } catch {
                handle(error: error)
            }
        }

        registerTask = task

        return task
    }

    private func handle(error: Error) {
        #if DEBUG
        Navigation.path.toast(
            title: "Error",
            message: error.localizedDescription,
            style: .error
        )
        #else
        print("⚠️ Error! - \(error)")
        Navigation.path.toast(
            title: "Error",
            message: "There was an error registering your account, please try again.",
            style: .error
        )
        #endif
    }
}
