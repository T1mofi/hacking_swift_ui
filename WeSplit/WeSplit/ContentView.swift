//
//  ContentView.swift
//  WeSplit
//
//  Created by Tima Sikorski on 28/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""

    private var names = ["Tima", "Konrad", "Andrzej"]
    @State private var selectedName = "Tima"

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                }

                Section {
                    Text("Hello, world!")
                    Text("Hello, world!") 
                    Text("Hello, world!")
                    Text("Hello, world!")
                }

                Section(header: Text("Binding")) {
                    Button("Tap Count: \(tapCount)") {
                        tapCount += 1
                    }
                }

                Section(header: Text("Two way binding")) {
                    TextField("Enter your name", text: $name)
                    Text("Your name is \(name)")
                }

                Section(header: Text("ForEach - simple")) {
                    ForEach(0..<3) {
                        Text(String($0))
                    }
                }

                Section(header: Text("ForEach")) {
                    Picker("Names picker", selection: $selectedName) {
                        ForEach(names, id:\.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)


        }

    }
}

#Preview {
    ContentView()
}
