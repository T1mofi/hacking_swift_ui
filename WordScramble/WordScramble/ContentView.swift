//
//  ContentView.swift
//  WordScramble
//
//  Created by Tima Sikorski on 24/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var bmwBodyCodes = ["E30", "E36", "E46", "E39", "E53"]
    @State var shouldShowAlert = false
    var body: some View {
        List {
            Section("BMW body codes") {
                ForEach(bmwBodyCodes, id: \.self) {
                    Text($0)
                }
            }
            Button("Delete one code") {
                guard !bmwBodyCodes.isEmpty else { return }
                bmwBodyCodes.removeLast()
            }
            Button("open url") {
                createURL()
            }
        }
        .listStyle(.grouped)
        .alert("URL created", isPresented: $shouldShowAlert) {
            Button("OK") {}
        }
    }

    func createURL() {
        guard let url = Bundle.main.url(forResource: "sample", withExtension: "txt") else {
            fatalError("file not found")
        }
        shouldShowAlert = true
    }
}

#Preview {
    ContentView()
}
