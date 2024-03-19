//
//  ContentView.swift
//  Hot Prospects
//
//  Created by Tima Sikorski on 19/03/2024.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]

    @State private var selection = Set<String>()

    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        EditButton()

        if !selection.isEmpty {
            Text("You selected \(selection.formatted())")
        }
    }
}

#Preview {
    ContentView()
}
