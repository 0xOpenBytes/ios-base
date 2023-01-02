//
//  RegisterViewModelTests.swift
//  baseTests
//
//  Created by Rob Maltese on 12/22/22.
//

import SwiftUI
import XCTest
@testable import base

final class RegisterViewModelTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        AppSettings.shared.user = nil
    }

    func testSuccessRegister() throws {
        // When
        let viewModel = RegisterViewModel(registerNetworking: SuccessMockRegisterService())

        // Then
        viewModel.registerUser()

        // Expect
        XCTAssertNil(AppSettings.shared.user)
    }

    func testNoDataRegisterFailure() throws {
        // When
        let viewModel = RegisterViewModel(registerNetworking: NoDataFailureMockRegisterService())

        // Then
        viewModel.registerUser()

        // Expect
        XCTAssertNil(AppSettings.shared.user)
    }

    func testValidationFailure() throws {
        // When
        let viewModel = RegisterViewModel(registerNetworking: ValidationFailureMockRegisterService())

        // Then
        viewModel.registerUser()

        // Expect
        XCTAssertNil(AppSettings.shared.user)
    }
}
