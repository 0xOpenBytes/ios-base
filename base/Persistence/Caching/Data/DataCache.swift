//
//  DataCache.swift
//  base
//
//  Created by Leif on 12/20/22.
//

import c
import Foundation
import SwiftUI

class DataCache: ObservableObject {
    private var lock: NSLock = NSLock()
    private var cache: c.KeyedCache<String> = .init()

    static var shared: DataCache = DataCache()

    var valuesInCache: [String: DataCaching] {
        cache.valuesInCache(ofType: DataCaching.self)
    }

    private init() { }

    func get<Value: DataCaching>(_ key: String, type: Value.Type = Value.self) -> Value? {
        cache.get(key, as: Value.self)
    }

    func resolve<Value: DataCaching>(_ key: String, type: Value.Type = Value.self) throws -> Value {
        try cache.resolve(key, as: Value.self)
    }

    func set(value: DataCaching, forKey key: String) {
        lock.lock()
        cache.set(value: value, forKey: key)
        lock.unlock()
        objectWillChange.send()
    }

    func remove(_ key: String) {
        lock.lock()
        cache.remove(key)
        lock.unlock()
        objectWillChange.send()
    }

    func contains(_ key: String) -> Bool {
        cache.contains(key)
    }

    func require(keys: Set<String>) throws -> Self {
        _ = try cache.require(keys: keys)

        return self
    }

    func require(_ key: String) throws -> Self {
        _ = try cache.require(key)

        return self
    }
}
