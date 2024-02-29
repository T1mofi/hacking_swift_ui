//
//  CoreImageContentView.swift
//  Instafilter
//
//  Created by Tima Sikorski on 29/02/2024.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct CoreImageContentView: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
        .ignoresSafeArea()
    }

    func loadImage() {
        let inputImage = UIImage(resource: .example)
        let beginImage = CIImage(image: inputImage)

        let context = CIContext()
        let currentFilter = CIFilter.pinchDistortion()
        currentFilter.inputImage = beginImage
        currentFilter.radius = 200
        currentFilter.center = CGPoint(x: inputImage.size.width, y: inputImage.size.height / 1.85)

        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
    }
}

#Preview {
    CoreImageContentView()
}
