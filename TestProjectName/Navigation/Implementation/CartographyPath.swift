//
//  CartographyPath.swift
//  TestProjectName
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

class CartographyPath: ObservableObject {
    private static let filePrefix = "CartographyPath"

    let id: String

    @Published var navigation: NavigationPath
    @Published var modal: CartographyModal?
    @Published var alert: CartographyAlert?
    @Published var actionSheet: CartographyActionSheet?
    @Published var toast: CartographyToast?

    init(id: String, _ codable: NavigationPath.CodableRepresentation? = nil) {
        self.id = id
        if let codable {
            navigation = NavigationPath(codable)
        } else {
            navigation = NavigationPath()
        }
        modal = nil
        alert = nil
        actionSheet = nil
        toast = nil
    }

    func save() {
        guard
            Navigation.shared.isPreview == false,
            let representation = navigation.codable
        else { return }

        do {
            try Disk.out(representation, filename: Self.name(id: id))
        } catch {
            print(error.localizedDescription)
        }
    }

    static func load(id: String) -> CartographyPath {
        defer {
            try? Disk.delete(filename: name(id: id))
        }

        return CartographyPath(id: id, try? Disk.in(filename: name(id: id)))
    }

    static func name(id: String) -> String {
        "\(filePrefix).\(id)"
    }
}

extension CartographyPath: ActionSheetPresenting, AlertPresenting, ModalPresenting,
                           ForwardNavigatable, BackwardNavigatable, ToastPreseting {

    public func actionSheet<ActionContent: View, MessageContent: View>(
        title: String,
        actions: @escaping () -> ActionContent,
        message: @escaping () -> MessageContent
    ) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.actionSheet(title: title, actions: actions, message: message)
            }
            return
        }

        actionSheet = CartographyActionSheet(
            title: title,
            actions: { AnyView(actions()) },
            message: { AnyView(message()) }
        )
    }

    public func alert(
        title: Text,
        message: Text? = nil,
        primaryButton: Alert.Button,
        secondaryButton: Alert.Button
    ) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.alert(
                    title: title,
                    message: message,
                    primaryButton: primaryButton,
                    secondaryButton: secondaryButton
                )
            }
            return
        }

        alert = CartographyAlert(
            title: title,
            message: message,
            primaryButton: primaryButton,
            secondaryButton: secondaryButton
        )
    }

    public func modal<Content: View>(
        body: @escaping () -> Content
    ) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.modal(body: body)
            }
            return
        }

        modal = CartographyModal(
            body: { AnyView(body()) }
        )
    }

    public func toast(
        title: String,
        message: String,
        style: ToastStyle,
        duration: Double? = 3
    ) {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.toast(
                    title: title,
                    message: message,
                    style: style,
                    duration: duration
                )
            }
            return
        }

        toast = CartographyToast(
            title: title,
            message: message,
            style: style,
            duration: duration
        )
    }

    public func push<V>(_ value: V) where V: Hashable {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.push(value)
            }
            return
        }

        navigation.append(value)
    }

    public func push<V>(_ value: V) where V: Codable, V: Hashable {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.push(value)
            }
            return
        }

        navigation.append(value)
    }

    public func pop() {
        guard Thread.isMainThread else {
            DispatchQueue.main.async {
                self.pop()
            }
            return
        }

        guard navigation.isEmpty == false else {
            return
        }

        navigation.removeLast()
    }
}
