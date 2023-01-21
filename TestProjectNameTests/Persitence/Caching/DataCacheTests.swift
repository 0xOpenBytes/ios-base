//
//  DataCacheTests.swift
//  TestProjectNameTests
//
//  Created by Leif on 12/20/22.
//

import SwiftUI
import XCTest
@testable import TestProjectName

final class DataCacheTests: XCTestCase {
    func testDataCache() throws {
        let cache = DataCache.shared

        let testID = UUID().uuidString
        let user = try XCTUnwrap(Mock.users.first)

        XCTAssertNil(cache.get(testID, type: User.self))

        cache.set(value: user, forKey: testID)

        XCTAssertNotNil(cache.get(testID, type: User.self))

        cache.remove(testID)

        XCTAssertNil(cache.get(testID, type: User.self))

        cache.set(value: Color.green, forKey: "color")

        let color: Color? = cache.get("color")

        XCTAssertNotNil(color)

        XCTAssertNotNil(cache.get("color", type: Color.self))
    }
}
