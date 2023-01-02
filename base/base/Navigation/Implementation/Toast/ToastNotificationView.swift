//
//  ToastNotificationView.swift
//  base
//
//  Created by Rob Maltese on 12/20/22.
//

import SwiftUI

struct ToastNotificationView: View {
    var title: String
    var message: String
    var style: ToastStyle
    var onCancelTapped: (() -> Void)

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image(systemName: style.toastIcon)
                    .foregroundColor(style.toastColor)

                VStack(alignment: .leading) {
                    Text(title)
                        .font(.callout)
                        .fontWeight(.semibold)

                    Text(message)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black.opacity(0.6))
                }

                Spacer(minLength: 8)

                Button {
                    onCancelTapped()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.black)
                }
            }
            .padding()
        }
        .background(Color.white)
        .overlay(
            Rectangle()
                .fill(style.toastColor)
                .frame(width: 6)
                .clipped(),
            alignment: .leading
        )
        .frame(minWidth: 0, maxWidth: .infinity)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 1)
        .padding(.horizontal, 16)
    }
}

// swiftlint:disable line_length
struct TempToastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ToastNotificationView(
                title: "Mock Error",
                message: "This is a mockup of a toast error alert. Each alert will have its own icon, title and message.",
                style: .error,
                onCancelTapped: { }
            )

            ToastNotificationView(
                title: "Mock Info",
                message: "This is a mockup of a toast info alert. Each alert will have its own icon, title and message.",
                style: .info,
                onCancelTapped: { }
            )

            ToastNotificationView(
                title: "Mock Success",
                message: "This is a mockup of a toast success alert. Each alert will have its own icon, title and message.",
                style: .success,
                onCancelTapped: { }
            )

            ToastNotificationView(
                title: "Mock Warning",
                message: "This is a mockup of a toast warning alert. Each alert will have its own icon, title and message.",
                style: .warning,
                onCancelTapped: { }
            )
        }
    }
}
// swiftlint:enable line_length
