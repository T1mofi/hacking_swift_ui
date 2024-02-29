//
//  CoreImageContentView.swift
//  Instafilter
//
//  Created by Tima Sikorski on 29/02/2024.
//

import SwiftUI

struct CoreImageContentView: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        image = Image(.example)
    }
}

#Preview {
    CoreImageContentView()
}
