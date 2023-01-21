//
//  ColorAdapter.swift
//  TestProjectName
//
//  Created by Leif on 1/2/23.
//

import SwiftUI

enum ColorAdapter: Adaptable {
    static func device(from: NetworkColor) throws -> Color {
        Color(
            red: from.red,
            green: from.green,
            blue: from.blue,
            opacity: from.alpha
        )
    }
}
