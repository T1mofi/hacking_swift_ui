//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 05/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView(columnVisibility: .constant(.all)) {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    ContentView()
}
