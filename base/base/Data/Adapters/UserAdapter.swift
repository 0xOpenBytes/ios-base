//
//  UserAdapter.swift
//  base
//
//  Created by Rob Maltese on 12/22/22.
//

import SwiftUI

enum UserAdapter: Adaptable {
    static func device(from: NetworkUser) throws -> User {
        User(
            id: from.id,
            username: from.name,
            email: from.email,
            color: try ColorAdapter.device(from: from.color)
        )
    }
}
