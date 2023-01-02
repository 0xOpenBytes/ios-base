//
//  AuthNetworking+Models.swift
//  base
//
//  Created by Leif on 12/21/22.
//

import Foundation
import t

enum AuthError: LocalizedError {
    case noData
    case validation(reason: String)

    var errorDescription: String? {
        switch self {
        case .noData:                   return "\(#fileID): No Data"
        case let .validation(reason):   return "\(#fileID): Validation: \(reason)"
        }
    }
}

// swiftlint:disable identifier_name
struct RegisterPayload: Codable {
    let name: String
    let email: String
    let password: String
    let password_confirmation: String

    init(name: String, email: String, password: String, confirmationPassword: String) {
        self.name = name
        self.email = email
        self.password = password
        self.password_confirmation = confirmationPassword
    }

    func validate() throws {
        try validateEmail()
        try validateUsername()
        try validatePasswords()
    }

    private func validateEmail() throws {
        do {
            try t.expect {
                try t.assert(email.count < 256)

                let regex = try Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,255}")

                try t.assert(email.matches(of: regex).isEmpty == false)
            }
        } catch {
            throw AuthError.validation(reason: "Invalid Email Address")
        }
    }

    private func validateUsername() throws {
        do {
            try t.expect {
                try t.assert(name.count < 256)
            }
        } catch {
            throw AuthError.validation(reason: "Username is too long")
        }
    }

    private func validatePasswords() throws {
        do {
            try t.expect {
                try t.assert(password, isEqualTo: password_confirmation)

                let regex = try Regex(#"^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{10, 255}$"#)

                try t.assert(password.matches(of: regex).isEmpty == false)
            }
        } catch {
            throw AuthError.validation(
                reason: """
                        Passwords must contain:
                            - At least 10 characters
                            - At least 1 lowercase
                            - At least 1 uppercase
                            - At least 1 number
                            - At least 1 symbol
                        """
            )
        }
    }
}

struct RegisterResponse: Codable {
    let user: NetworkUser
    let access_token: String

    var token: String { access_token }
}
