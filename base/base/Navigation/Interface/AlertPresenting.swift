//
//  AlertPresenting.swift
//  base
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

protocol AlertPresenting {
    func alert(
        title: Text,
        message: Text?,
        primaryButton: Alert.Button,
        secondaryButton: Alert.Button
    )
}
