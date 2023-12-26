//
//  ContentView.swift
//  Animations
//
//  Created by Tima Sikorski on 25/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0

    var body: some View {
        VStack {
            Button("Tap Me") {
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(.easeInOut(duration: 1.0).repeatForever(autoreverses: false), value: animationAmount)

            )
            .onAppear {
                animationAmount = 2.0
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
