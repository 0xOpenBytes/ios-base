//
//  RegisterPayloadTests.swift
//  TestProjectNameTests
//
//  Created by Leif on 12/21/22.
//

import XCTest
@testable import TestProjectName

final class RegisterPayloadTests: XCTestCase {
    enum Valid {
        static let name = "Valid Name"
        static let email = "valid.email@OB.com"
        static let password = "Validp@ss0rd"
    }

    enum Invalid {
        static let name = String(repeating: "W", count: 300)
        static let email = "invalid.emai"
        static let password = "invalid password"
    }

    func testBadUsername() throws {
        XCTAssertThrowsError(
            try RegisterPayload(
                name: Invalid.name,
                email: Valid.email,
                password: Valid.password,
                confirmationPassword: Valid.password
            )
            .validate()
        )
    }

    func testBadEmail() throws {
        XCTAssertThrowsError(
            try RegisterPayload(
                name: Valid.name,
                email: Invalid.email,
                password: Valid.password,
                confirmationPassword: Valid.password
            )
            .validate()
        )
    }

    func testBadPassword() throws {
        XCTAssertThrowsError(
            try RegisterPayload(
                name: Valid.name,
                email: Valid.email,
                password: Invalid.password,
                confirmationPassword: Invalid.password
            )
            .validate()
        )
    }

    func testMismatchedPasswords() throws {
        XCTAssertThrowsError(
            try RegisterPayload(
                name: Valid.name,
                email: Valid.email,
                password: Valid.password,
                confirmationPassword: Invalid.password
            )
            .validate()
        )
    }

    func testValidPayload() throws {
        XCTAssertNoThrow(
            try RegisterPayload(
                name: Valid.name,
                email: Valid.email,
                password: Valid.password,
                confirmationPassword: Valid.password
            )
            .validate()
        )
    }
}
