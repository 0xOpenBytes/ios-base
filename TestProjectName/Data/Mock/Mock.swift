//
//  Mock.swift
//  TestProjectName
//
//  Created by Rob Maltese on 12/17/22.
//

import Foundation

enum Mock {
    static func json<Value: Codable>(
        named: String,
        type: Value.Type = Value.self,
        using decoder: JSONDecoder = JSONDecoder()
    ) throws -> Value? {
        guard let file = Bundle.main.url(forResource: named, withExtension: "json") else {
            return nil
        }

        return try decoder.decode(Value.self, from: Data(contentsOf: file))
    }
}
