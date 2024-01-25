//
//  ContentView.swift
//  Better You
//
//  Created by Tima Sikorski on 21/01/2024.
//

import SwiftUI

struct ContentView: View {
//    var activities = Activities(array: [
//        Activity(title: "activity 1", description: "activity 1 description", activityCompletionCount: 0),
//        Activity(title: "activity 2", description: "activity 2 description", activityCompletionCount: 0),
//    ])
    var activities = Activities()

    @State private var showActivityCreator: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items, content: { activity in
                    NavigationLink(activity.title) {
                        ActivityView(activity: activity, activities: activities)
                    }
                })
                .onDelete(perform: { indexSet in
                    activities.items.remove(atOffsets: indexSet)
                })
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Activity", systemImage: "plus") {
                        showActivityCreator = true
                    }
                }
            }
            .sheet(isPresented: $showActivityCreator) {
                ActivityCreationView(activities: activities)
            }
        }
    }
}

#Preview {
    ContentView()
}
