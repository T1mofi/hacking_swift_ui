//
//  ContentView.swift
//  WordScramble
//
//  Created by Tima Sikorski on 24/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            Text("static cell")
            ForEach(0..<6) {
                Text("\($0)")
            }

            Section("secondSection") {
                Text("lol")
                Text("kek")
            }
        }
        .listStyle(.grouped)
    }
}

#Preview {
    ContentView()
}
