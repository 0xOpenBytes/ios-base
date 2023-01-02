//
//  RegisterFields.swift
//  base
//
//  Created by Rob Maltese on 12/21/22.
//

import SwiftUI

struct RegisterFields: View {
    @Binding var username: String
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordConfirmation: String

    @FocusState var focused: Bool

    var body: some View {
        TextField(text: $username) { Text("Username") }
            .focused($focused)
        TextField(text: $email) { Text("Email") }
            .focused($focused)
        SecureField(text: $password) { Text("Password") }
            .focused($focused)
        SecureField(text: $passwordConfirmation) { Text("Confirm Password") }
            .focused($focused)
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterFields(
            username: .constant(""),
            email: .constant(""),
            password: .constant(""),
            passwordConfirmation: .constant("")
        )
    }
}
