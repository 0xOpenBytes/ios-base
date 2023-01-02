//
//  NetworkUser.swift
//  base
//
//  Created by Rob Maltese on 12/22/22.
//

import Foundation

struct NetworkUser: Codable {
    let id: UUID
    let name: String
    let email: String
    let color: NetworkColor
}
