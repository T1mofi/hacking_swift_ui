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
    @State var alertMessage = ""
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
        .alert("URL creation result", isPresented: $shouldShowAlert, actions: {
            Button("OK") {}
        }, message: {
            Text(alertMessage)
        })
    }

    func createURL() {
        guard let url = Bundle.main.url(forResource: "sample", withExtension: "txt"),
            let fileContentsString = try? String(contentsOf: url) else {
            alertMessage = "failed to read the file"
            return
        }
        alertMessage = "\(fileContentsString)"
        shouldShowAlert = true
    }
}

#Preview {
    ContentView()
}
