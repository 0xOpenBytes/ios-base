//
//  base template generated by OpenBytes on 12/22/22.
//  Copyright (c) 2023 OpenBytes
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the conditions found at the following link:
//  https://github.com/0xOpenBytes/ios-BASE/blob/main/LICENSE
//
// Created by Rob Maltese.
//  RegisterViewModelTests.swift
//

import SwiftUI
import XCTest
@testable import base

final class RegisterViewModelTests: XCTestCase {
    override func setUp() {
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
