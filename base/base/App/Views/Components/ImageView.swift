//
//  ImageView.swift
//  base
//
//  Created by Leif on 12/21/22.
//

import SwiftUI

class ImageViewModel: ObservableObject {
    @Published var image: Image?

    func loadImage(for url: URL?) async {
        guard let url = url else {
            print("URL was nil")
            return
        }

        let loadedImage = await load(url: url)

        await MainActor.run {
            self.image = loadedImage
        }
    }

    private func load(url: URL) async -> Image? {
        if let cachedImage = ImageCache.shared.get(url) {
            return cachedImage
        }

        do {
            guard
                let data = try await Network.get(url: url).0,
                let imageData = UIImage(data: data)
            else { return nil }

            let loadedImage = Image(uiImage: imageData)

            ImageCache.shared.set(image: loadedImage, forKey: url)

            return loadedImage
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

struct ImageView<Content: View, Placeholder: View>: View {
    @ObservedObject private var viewModel = ImageViewModel()

    let url: URL?
    let content: (Image) -> Content
    let placeholder: () -> Placeholder

    var body: some View {
        if let image = viewModel.image {
            content(image)
        } else {
            placeholder()
                .task {
                    await viewModel.loadImage(for: url)
                }
        }
    }
}
