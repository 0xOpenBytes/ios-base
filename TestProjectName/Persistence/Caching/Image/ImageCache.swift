//
//  ImageCache.swift
//  TestProjectName
//
//  Created by Leif on 12/20/22.
//

import c
import Foundation
import SwiftUI

class ImageCache: ObservableObject {
    private var lock: NSLock = NSLock()
    private var cache: c.KeyedCache<URL> = .init()

    static var shared: ImageCache = ImageCache()

    var valuesInCache: [URL: Image] {
        cache.valuesInCache(ofType: Image.self)
    }

    private init() { }

    func get(_ key: URL) -> Image? {
        cache.get(key, as: Image.self)
    }

    func resolve(_ key: URL) throws -> Image {
        try cache.resolve(key, as: Image.self)
    }

    func set(image: Image, forKey key: URL) {
        lock.lock()
        cache.set(value: image, forKey: key)
        lock.unlock()
        objectWillChange.send()
    }

    func remove(_ key: URL) {
        lock.lock()
        cache.remove(key)
        lock.unlock()
        objectWillChange.send()
    }

    func contains(_ key: URL) -> Bool {
        cache.contains(key)
    }

    func require(keys: Set<URL>) throws -> Self {
        _ = try cache.require(keys: keys)

        return self
    }

    func require(_ key: URL) throws -> Self {
        _ = try cache.require(key)

        return self
    }
}
