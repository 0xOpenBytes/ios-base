//
//  CartographyView.swift
//  base
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

struct CartographyView<RootView: View>: View {
    @ObservedObject var path: CartographyPath
    let rootView: () -> RootView

    var body: some View {
        NavigationStack(path: $path.navigation) {
            rootView()
                .sheet(
                    item: $path.modal,
                    content: { modal in
                        modal.body()
                    }
                )
                .alert(
                    item: $path.alert,
                    content: { alert in
                        SwiftUI.Alert(
                            title: alert.title,
                            message: alert.message,
                            primaryButton: alert.primaryButton,
                            secondaryButton: alert.secondaryButton
                        )
                    }
                )
                .confirmationDialog(
                    path.actionSheet?.title ?? "",
                    isPresented: Binding(
                        get: { path.actionSheet != nil },
                        set: { newValue  in
                            if newValue == false {
                                path.actionSheet = nil
                            }
                        }
                    ),
                    presenting: path.actionSheet,
                    actions: { actionSheet in
                        actionSheet.actions()
                    },
                    message: { actionSheet in
                        actionSheet.message()
                    }
                )
                .modifier(ToastModifer(toast: $path.toast))
        }
    }
}

extension CartographyView {
    static func preview(_ content: @escaping () -> RootView) -> CartographyView {
        Navigation.shared.isPreview = true

        return CartographyView(path: Navigation.path, rootView: content)
    }
}
