//
//  AcknowledgmentView.swift
//  base
//
//  Created by Leif on 1/31/23.
//

import Disk
import OpenBytesNavigation
import SwiftUI

struct Acknowledgment: Identifiable, Codable, Hashable {
    var id: Self { self }

    let title: String
    let author: String
    let url: URL?
    let iconURL: URL?
    let description: String
}

extension OBbaseApp {
    static var acknowledgments: [Acknowledgment] {
        do {
            return try Disk.json(named: "oss", type: [Acknowledgment].self) ?? []
        } catch {
            return []
        }
    }
}

struct AcknowledgmentView: View {
    let acknowledgments: [Acknowledgment]

    init(acknowledgments: [Acknowledgment] = OBbaseApp.acknowledgments) {
        self.acknowledgments = acknowledgments
    }

    var body: some View {
        Form {
            ForEach(acknowledgments) { acknowledgment in
                VStack(spacing: 8) {
                    titleView(acknowledgment: acknowledgment)
                    descriptionView(acknowledgment: acknowledgment)
                }
            }
        }
        .navigationTitle("Acknowledgments")
    }

    private func titleView(acknowledgment: Acknowledgment) -> some View {
        HStack(spacing: 8) {
            if let url = acknowledgment.iconURL {
                ImageView(
                    url: url,
                    content: { image in
                        image.resizable()
                            .frame(width: 44, height: 44)
                            .clipShape(Circle())
                    },
                    placeholder: { ProgressView() }
                )
            }

            Button(
                action: {
                    guard let url = acknowledgment.url else {
                        print(
                            "Invalid Acknowledgment URL: '\(String(describing: acknowledgment.url))'"
                        )
                        return
                    }

                    UIApplication.shared.open(url)
                },
                label: {
                    Text(acknowledgment.title)
                        .font(.title2)
                }
            )

            Spacer()
        }
    }

    private func descriptionView(acknowledgment: Acknowledgment) -> some View {
        HStack {
            Text(
                """
                \(acknowledgment.author)

                \(acknowledgment.description)
                """
            )
            .font(.body)

            Spacer()
        }
    }
}

struct OSSAcknowledgmentView_Previews: PreviewProvider {
    static var previews: some View {
        OpenBytesNavigationView.preview {
            AcknowledgmentView()
        }
    }
}
