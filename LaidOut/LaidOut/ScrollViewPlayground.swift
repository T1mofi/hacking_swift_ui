//
//  ScrollViewPlayground.swift
//  LaidOut
//
//  Created by Tima Sikorski on 29/03/2024.
//

import SwiftUI

struct ScrollViewPlayground: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(proxy.frame(in: .global).minY / 200)
                            .scaleEffect(getScale(scale: proxy.frame(in: .global).minY / fullView.size.height))
                    }
                    .frame(height: 40)
                }
            }
        }
    }

    func getScale(scale: CGFloat) -> CGSize {
        let adjustedScale = 0.3 + 0.7 * scale
        return CGSize(width: adjustedScale, height: 1.0)
    }
}

#Preview {
    ScrollViewPlayground()
}
