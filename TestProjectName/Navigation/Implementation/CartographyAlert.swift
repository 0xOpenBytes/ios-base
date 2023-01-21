//
//  CartographyAlert.swift
//  TestProjectName
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

struct CartographyAlert: Identifiable {
    let id: UUID = UUID()

    let title: Text
    let message: Text?
    let primaryButton: Alert.Button
    let secondaryButton: Alert.Button
}
