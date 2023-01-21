//
//  ToastModifier.swift
//  TestProjectName
//
//  Created by Rob Maltese on 12/20/22.
//

import SwiftUI

struct ToastModifer: ViewModifier {
    @Binding var toast: CartographyToast?
    @State private var workItem: DispatchWorkItem?

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                toastView()
                    .animation(.spring(), value: toast)
            )
            .onChange(of: toast) { _ in
                showToast()
            }
    }

    @ViewBuilder func toastView() -> some View {
        if let toast = toast {
            /// This defines where on our view the notification will actually display.
            /// If you place it at the top of the stack, it will make it display at the bottom.
            VStack {
                ToastNotificationView(
                    title: toast.title,
                    message: toast.message,
                    style: toast.style,
                    onCancelTapped: dismissToast
                )

                Spacer()
            }
            .transition(.move(edge: .top))
        }
    }

    private func showToast() {
        guard let toast = toast else { return }

        UIImpactFeedbackGenerator(style: .light).impactOccurred()

        guard let duration = toast.duration else { return }

        if duration > 0 {
            workItem?.cancel()

            let task = DispatchWorkItem {
                dismissToast()
            }

            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: task)
        }
    }

    private func dismissToast() {
        withAnimation {
            toast = nil
        }

        workItem?.cancel()
        workItem = nil
    }
}
