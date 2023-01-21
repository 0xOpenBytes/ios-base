//
//  CartographyActionSheet.swift
//  TestProjectName
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

struct CartographyActionSheet: Identifiable {
    let id: UUID = UUID()

    let title: String
    let actions: () -> AnyView
    let message: () -> AnyView
}
