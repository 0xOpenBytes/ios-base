//
//  RegisterNetworking.swift
//  base
//
//  Created by Rob Maltese on 12/21/22.
//

import Foundation

/// Outlines functions and / or `get` `set` variables which will get called in the services. This function is marked `async` to run in the background and not block the main thread. It is also marked `throws` which allows for catching of errors and handle them accordingly.
protocol RegisterNetworking {
    /// Function that takes in the required parameters to be called down to the networking function. All of the parameters listed, **must not** be empty.
    /// - returns: An instance of a User.
    ///
    /// - parameters:
    ///     - username: Users desired username.
    ///     - email: Users email address.
    ///     - password: Users desired password, must meet validation requirements.
    ///     - passwordConfirmation: Confirmation password which must match the users password.
   mutating func register(
    username: String,
    email: String,
    password: String,
    passwordConfirmation: String
   ) async throws -> User
}


/// Conforms to both `RegisterNetworking` protocol as well as `AuthNetworking`. The functions contained within the struct are functions which are within the `RegisterNetworking` protocol.
struct ProductionRegisterService: RegisterNetworking, AuthNetworking {
    /**
     Function that takes in the required parameters to be called down to the networking function. All of the parameters listed, **must not** be empty.

     - returns: An instance of a User.

     - parameters:
        - username: Users desired username.
         - email: Users email address.
         - password: Users desired password, must meet validation requirements.
         - passwordConfirmation: Confirmation password which must match the users password.

     The `let response` returns the `NetworkUser` model which is then passed through the `UserAdapter.device(from: )` which will then sanitize the return into a forward facing, device model.
     */
    mutating func register(
        username: String,
        email: String,
        password: String,
        passwordConfirmation: String
    ) async throws -> User {
        let response = try await register(
            name: username,
            email: email,
            password: password,
            confirmationPassword: passwordConfirmation
        )
        return try UserAdapter.device(from: response.user)
    }
}

// Success Register
struct SuccessMockRegisterService: RegisterNetworking {
    func register(
        username: String,
        email: String,
        password: String,
        passwordConfirmation: String
    ) async throws -> User {
        return User(username: username, email: email, color: .green)
    }
}

// No Data Failure Register
struct NoDataFailureMockRegisterService: RegisterNetworking {
    func register(
        username: String,
        email: String,
        password: String,
        passwordConfirmation: String
    ) async throws -> User {
      throw AuthError.noData
    }
}

// Validation Failure Register
struct ValidationFailureMockRegisterService: RegisterNetworking {
    func register(
        username: String,
        email: String,
        password: String,
        passwordConfirmation: String
    ) async throws -> User {
        throw AuthError.validation(reason: "Mock Failure")
    }
}
