//
//  SearchScreen.swift
//  TestProjectName
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

struct SearchScreen: View {
    var body: some View {
        List {
            Button(
                action: { Navigation.path.push(Date()) },
                label: { Text("Push") }
            )

            Button(
                action: { Navigation.path.modal { Text("Modal") } },
                label: { Text("Modal") }
            )

            Button(
                action: {
                    Navigation.path.alert(
                        title: Text("Alert Title"),
                        primaryButton: .default(Text("Done")),
                        secondaryButton: .cancel()
                    )
                },
                label: { Text("Alert") }
            )

            Button(
                action: {
                    Navigation.path.actionSheet(
                        title: "Action Sheet Title",
                        actions: {
                            Button(
                                action: { print("Hi") },
                                label: { Text("Say Hi") }
                            )
                        },
                        message: { Text("Action Sheet Message") }
                    )
                },
                label: { Text("Action Sheet") }
            )

            Button {
                Navigation.path.toast(
                    title: "Toast Title",
                    message: "This is a toast message and can be fairly long if needed.",
                    style: .error
                )
            } label: {
                Text("Toast Alert")
            }

        }
        .navigationDestination(
            for: Date.self,
            destination: { date in
                Text(date, format: .dateTime)
            }
        )
        .navigationTitle("Search")
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartographyView.preview {
            SearchScreen()
        }
    }
}
