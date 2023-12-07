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

            VStack {
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

                    // Condition Modifier
                    Button("Change my text color") {
                        shouldUsePinkColor.toggle()
                    }
                    .foregroundStyle(shouldUsePinkColor ? .pink : .blue)
                }


                // Environment Modifiers
                VStack {
                    ForEach(0..<5) { _ in
                        Text("test example")
                    }
                }
                .font(.title)
                .foregroundColor(.white)
                .blur(radius: 1)
            }
        }
    }
}

#Preview {
    ContentView()
}
