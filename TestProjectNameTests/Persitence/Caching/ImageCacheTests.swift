//
//  ImageCacheTests.swift
//  TestProjectNameTests
//
//  Created by Leif on 12/20/22.
//

import SwiftUI
import XCTest
@testable import TestProjectName

final class ImageCacheTests: XCTestCase {
    func testImageCache() throws {
        let cache = ImageCache.shared

        let imageURL = URL(string: "test-image")!

        XCTAssertNil(cache.get(imageURL))

        cache.set(image: Image(systemName: "circle"), forKey: imageURL)

        XCTAssertNotNil(cache.get(imageURL))

        cache.remove(imageURL)

        XCTAssertNil(cache.get(imageURL))
    }
}
