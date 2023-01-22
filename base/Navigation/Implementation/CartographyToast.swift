//
//  CartographyToast.swift
//  base
//
//  Created by Rob Maltese on 12/20/22.
//

import SwiftUI

struct CartographyToast: Identifiable, Equatable {
    let id: UUID = UUID()

    let title: String
    let message: String
    let style: ToastStyle
    let duration: Double?
}
