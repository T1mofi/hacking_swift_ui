//
//  GeometryReaderView.swift
//  LaidOut
//
//  Created by Tima Sikorski on 28/03/2024.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        GeometryReader { proxy in
            Image(.example)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }

        HStack {
            Image(.example)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.8
                }

            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
        }
    }
}

#Preview {
    GeometryReaderView()
}
