//
//  ContentView.swift
//  Better You
//
//  Created by Tima Sikorski on 21/01/2024.
//

import SwiftUI

struct ContentView: View {
    var activities = Activities(array: [
        Activity(title: "activity 1", description: "activity 1 description"),
        Activity(title: "activity 2", description: "activity 2 description"),
    ])

    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.array, content: { activity in
                    Text(activity.title)
                })
            }
        }
    }
}

#Preview {
    ContentView()
}
