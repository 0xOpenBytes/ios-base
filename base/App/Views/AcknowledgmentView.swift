//
//  AcknowledgmentView.swift
//  base
//
//  Created by Leif on 1/31/23.
//

import SwiftUI

struct Acknowledgment: Identifiable {
    let id: UUID = UUID()
    let title: String
    let author: String
    let url: URL?
    let iconURL: URL?
    let description: String
}

// swiftlint:disable line_length
extension OBbaseApp {
    static var acknowledgments: [Acknowledgment] {
        [
            Acknowledgment(
                title: "Fork",
                author: "0xLeif",
                url: URL(string: "https://github.com/0xLeif/Fork"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/8268288?v=4"),
                description: "Fork is a Swift library that allows for parallelizing multiple async functions. It provides a Fork struct that takes a single input and splits it into two separate async functions that return different outputs. The two functions can then be merged into one which returns a single output."
            ),
            Acknowledgment(
                title: "o",
                author: "0xOpenBytes",
                url: URL(string: "https://github.com/0xOpenBytes/o"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/92551192"),
                description: "Allows us to get the input and set the output of file, url, the console, and UserNotifications."
            ),
            Acknowledgment(
                title: "c",
                author: "0xOpenBytes",
                url: URL(string: "https://github.com/0xOpenBytes/c"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/92551192"),
                description: "Allows us to transform types from one to another while also providing us the various caching options."
            ),
            Acknowledgment(
                title: "Swish",
                author: "FullQueueDeveloper",
                url: URL(string: "https://github.com/FullQueueDeveloper/Swish"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/103295874"),
                description: "Swish is a Swift script running tool to easily run Swift packages in a supporting relative directory named Swish. Swish pairs nicely with Sh to run shell commands and process shell output from your Swift scripts."
            ),
            Acknowledgment(
                title: "Sh",
                author: "FullQueueDeveloper",
                url: URL(string: "https://github.com/FullQueueDeveloper/Sh"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/103295874"),
                description: "Sh lets you reason about your script in Swift, easily calling shell commands and using their output in your Swift program. Or when orchestrating a build script, simply redirect all output to the terminal, a log file, or /dev/null."
            ),
            Acknowledgment(
                title: "ShGit",
                author: "FullQueueDeveloper",
                url: URL(string: "https://github.com/FullQueueDeveloper/ShGit"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/103295874"),
                description: "Git wrapper for Swift powered by Sh."
            ),
            Acknowledgment(
                title: "ShXcrun",
                author: "FullQueueDeveloper",
                url: URL(string: "https://github.com/FullQueueDeveloper/ShXcrun"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/103295874"),
                description: "A wrapper around xcodebuild, agvtool, and other xcrun tools, built on top of Sh."
            ),
            Acknowledgment(
                title: "XcodeGen",
                author: "yonaskolb",
                url: URL(string: "https://github.com/yonaskolb/XcodeGen"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/2393781"),
                description: "XcodeGen is a command line tool written in Swift that generates your Xcode project using your folder structure and a project spec."
            ),
            Acknowledgment(
                title: "xcparse",
                author: "ChargePoint",
                url: URL(string: "https://github.com/ChargePoint/xcparse"),
                iconURL: URL(string: "https://avatars.githubusercontent.com/u/9879654"),
                description: "A command line tool to extract code coverage & screenshots from Xcode 11 XCResult files."
            )
        ]
    }
}
// swiftlint:enable line_length

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
                        .font(.title)
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
        CartographyView.preview {
            AcknowledgmentView()
        }
    }
}
