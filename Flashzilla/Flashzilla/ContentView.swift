//
//  ContentView.swift
//  Flashzilla
//
//  Created by Tima Sikorski on 24/03/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .onTapGesture(count: 2) {
                    print("DoupleTap recognized")
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
