//
//  AuthNetworking+Default.swift
//  TestProjectName
//
//  Created by Leif on 12/21/22.
//

import Foundation

extension AuthNetworking {
    var tokenFileName: String { "TestProjectName.token" }

    var authURL: URL {
        URL(string: "AUTH_URL")! // TODO: (TestProjectName-Template) Change AUTH_URL to valid URL
    }

    var token: String? {
        get {
            do {
                return try Disk.in(filename: tokenFileName)
            } catch {
                print(error.localizedDescription)
                return nil
            }
        }

        set {
            do {
                guard let newValue = newValue else {
                    try Disk.delete(filename: tokenFileName)
                    return
                }

                try Disk.out(newValue, filename: tokenFileName)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    mutating func register(
        name: String,
        email: String,
        password: String,
        confirmationPassword: String
    ) async throws -> RegisterResponse {
        let payload = RegisterPayload(
            name: name,
            email: email,
            password: password,
            confirmationPassword: confirmationPassword
        )

        // Check Validation
        try payload.validate()

        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601

        let dataResponse = try await Network.post(
            url: authURL.appendingPathComponent("register"),
            body: try encoder.encode(payload)
        )

        // Check Response
        let httpResponse = dataResponse.response as? HTTPURLResponse

        guard httpResponse?.statusCode == 200 else {
            throw AuthError.validation(reason: "Status code was not 200, but was: '\(httpResponse?.statusCode ?? -1)'")
        }

        guard let data = dataResponse.data else {
            throw AuthError.noData
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        let registerResponse = try decoder.decode(RegisterResponse.self, from: data)

        // Save the token
        token = registerResponse.token

        return registerResponse
    }
}
