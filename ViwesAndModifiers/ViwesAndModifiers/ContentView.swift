//
//  ContentView.swift
//  ViwesAndModifiers
//
//  Created by Tima Sikorski on 07/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldUsePinkColor = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)

            VStack(spacing: 50) {
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

                Button("Change my text color") {
                    shouldUsePinkColor.toggle()
                }
                .foregroundStyle(shouldUsePinkColor ? .pink : .blue)
            }
        }
    }
}

#Preview {
    ContentView()
}
