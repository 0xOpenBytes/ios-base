//
//  ExampleAdapterTest.swift
//  baseTests
//
//  Created by Leif on 12/20/22.
//

import SwiftUI
import XCTest
@testable import base

final class ExampleAdapterTest: XCTestCase {
    func testAdapter() throws {
        let networkModel: NetworkUser = try XCTUnwrap(Mock.json(named: "mock-user"))

        let deviceModel = try UserAdapter.device(from: networkModel)

        XCTAssertEqual(deviceModel.id, networkModel.id)
        XCTAssertEqual(deviceModel.color, Color(red: 0, green: 0.5, blue: 0))
        XCTAssertEqual(deviceModel.username, networkModel.name)
        XCTAssertEqual(deviceModel.email, networkModel.email)
    }
}
