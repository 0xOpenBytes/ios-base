//
//  Taskable.swift
//  TestProjectName
//
//  Created by Leif on 12/17/22.
//

import Foundation

protocol Taskable: Usable {
    func task(value action: (Self) async throws -> Void) async throws
    func task<Value>(value action: (Self) async throws -> Value) async throws -> Value
}

protocol StaticTaskable: StaticUsable {
    static func task(type action: (Self.Type) async throws -> Void) async throws
    static func task<Value>(type action: (Self.Type) async throws -> Value) async throws -> Value
}

extension Taskable {
    func task(value action: (Self) async throws -> Void) async throws {
        try await action(self)
    }

    func task<Value>(value action: (Self) async throws -> Value) async throws -> Value {
        try await action(self)
    }
}

extension StaticTaskable {
    static func task(type action: (Self.Type) async throws -> Void) async throws {
        try await action(Self.self)
    }

    static func task<Value>(type action: (Self.Type) async throws -> Value) async throws -> Value {
        try await action(Self.self)
    }
}
