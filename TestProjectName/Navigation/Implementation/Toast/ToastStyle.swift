//
//  ToastStyle.swift
//  TestProjectName
//
//  Created by Rob Maltese on 12/20/22.
//

import SwiftUI

/// This allows us to define the style of the `ToastNotification` in a easy and clean manner.
/// - `toastColor`: Defines the color of the icon and the notification style of the type selected.
/// - `toastIcon`: Defines the icon displayed relevant to the overall notification type selected.
enum ToastStyle {
    case error
    case success
    case warning
    case info

    var toastColor: Color {
        switch self {
        case .error:
            return .red
        case .success:
            return .green
        case .warning:
            return .yellow
        case .info:
            return .blue
        }
    }

    var toastIcon: String {
        switch self {
        case .error:
            return "info.circle.fill"
        case .success:
            return "checkmark.circle.fill"
        case .warning:
            return "exclamationmark.circle.fill"
        case .info:
            return "info.circle.fill"
        }
    }
}
