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
                if animationAmount >= 3.0 {
                    animationAmount = 1.0
                } else {
                    animationAmount += 1.0
                }
            }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount)
            .animation(.bouncy(duration: 0.2, extraBounce: 0.4), value: animationAmount)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
