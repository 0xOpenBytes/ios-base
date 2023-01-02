//
//  User.swift
//  base
//
//  Created by Rob Maltese on 12/22/22.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var username: String
    var email: String
    var color: Color
}
