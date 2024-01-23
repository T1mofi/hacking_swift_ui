//
//  ActivityCreationView.swift
//  Better You
//
//  Created by Tima Sikorski on 21/01/2024.
//

import SwiftUI

struct ActivityCreationView: View {
    @Environment(\.dismiss) var dismiss

    var activities: Activities

    @State private var title = ""
    @State private var description = ""

    var body: some View {
        NavigationStack{
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description, prompt: Text("More details about the activity"), axis: .vertical)

            }
            .navigationTitle("Add Activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newActivity = Activity(title: title, description: description, activityCompletionCount: 0)
                        activities.array.append(newActivity)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ActivityCreationView(activities: Activities(array: []))
}
