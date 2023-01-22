//
//  RegisterNetworking.swift
//  base
//
//  Created by Rob Maltese on 12/21/22.
//

import Foundation

protocol RegisterNetworking {
   mutating func register(
    username: String,
    email: String,
    password: String,
    passwordConfirmation: String
   ) async throws -> User
}

struct ProductionRegisterService: RegisterNetworking, AuthNetworking {
    mutating func register(
        username: String,
        email: String,
        password: String,
        passwordConfirmation: String
    ) async throws -> User {
        // Register user
        let response = try await register(
            name: username,
            email: email,
            password: password,
            confirmationPassword: passwordConfirmation
        )

        // Return Device User from NetworkUser object
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
