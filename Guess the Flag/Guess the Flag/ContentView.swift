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
            RadialGradient(colors: [.cyan, .blue, .indigo, .purple, .pink], center: .center, startRadius: 100, endRadius: 350)
                .ignoresSafeArea()
            RadialGradient(colors: [.pink, .purple, .indigo , .cyan], center: .center, startRadius: 0, endRadius: 100)

                .ignoresSafeArea()
                .frame(width: 200, height: 200)
                .cornerRadius(100)
        }
    }
}

#Preview {
    ContentView()
}
