//
//  Usable.swift
//  base
//
//  Created by Leif on 12/17/22.
//

import Foundation

protocol Usable {
    func use(value action: (Self) -> Void)
    func use<Value>(value action: (Self) -> Value) -> Value
}

protocol StaticUsable {
    static func use(type action: (Self.Type) -> Void)
    static func use<Value>(type action: (Self.Type) -> Value) -> Value
}

extension Usable {
    func use(value action: (Self) -> Void) {
        action(self)
    }

    func use<Value>(value action: (Self) -> Value) -> Value {
        action(self)
    }
}

extension StaticUsable {
    static func use(type action: (Self.Type) -> Void) {
        action(Self.self)
    }

    static func use<Value>(type action: (Self.Type) -> Value) -> Value {
        action(Self.self)
    }
}
