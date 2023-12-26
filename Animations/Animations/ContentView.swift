//
//  ContentView.swift
//  Animations
//
//  Created by Tima Sikorski on 25/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0

    var body: some View {
        return VStack {
            Button("Tap Me") {
                withAnimation(.linear(duration: 3)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 1, z: 1))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
