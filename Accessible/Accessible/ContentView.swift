//
//  ContentView.swift
//  Accessible
//
//  Created by Tima Sikorski on 13/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10

    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    ContentView()
}
