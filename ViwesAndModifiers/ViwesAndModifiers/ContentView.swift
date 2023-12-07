//
//  ContentView.swift
//  ViwesAndModifiers
//
//  Created by Tima Sikorski on 07/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Understand the type
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .frame(maxWidth: 200, maxHeight: 200)
                .background(.cyan)
            Button("check info") {
                print(type(of: self.body))
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
