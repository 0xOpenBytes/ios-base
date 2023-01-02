//
//  AuthNetworking.swift
//  base
//
//  Created by Leif on 12/15/22.
//

import Foundation

protocol AuthNetworking {
    var baseURL: URL { get }
    var token: String? { get }

    mutating func register(
        name: String,
        email: String,
        password: String,
        confirmationPassword: String
    ) async throws -> RegisterResponse
}
