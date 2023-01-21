//
//  RegisterViewModelTests.swift
//  TestProjectNameTests
//
//  Created by Rob Maltese on 12/22/22.
//

import SwiftUI
import XCTest
@testable import TestProjectName

final class RegisterViewModelTests: XCTestCase {
    override class func setUp() {
        super.setUp()

        AppSettings.shared.user = nil
    }

    func testSuccessRegister() async throws {
        // When
        let viewModel = RegisterViewModel(registerNetworking: SuccessMockRegisterService())

        // Then
        let task = viewModel.registerUser()

        // Wait for the task to finish
        await task.value

        // Expect
        XCTAssertNotNil(AppSettings.shared.user)

        // Finally
        AppSettings.shared.user = nil
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
