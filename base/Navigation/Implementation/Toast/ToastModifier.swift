//
//  base template generated by OpenBytes on 12/20/22.
//  Copyright (c) 2023 OpenBytes
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the conditions found at the following link:
//  https://github.com/0xOpenBytes/ios-BASE/blob/main/LICENSE
//
// Created by Rob Maltese.
//  ToastModifer.swift
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
