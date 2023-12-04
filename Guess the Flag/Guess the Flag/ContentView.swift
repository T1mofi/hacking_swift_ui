//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Tima Sikorski on 04/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.cyan
                Color.indigo
            }
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(20)
                .background(.ultraThinMaterial)
                .cornerRadius(5)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
