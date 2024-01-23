//
//  ActivityView.swift
//  Better You
//
//  Created by Tima Sikorski on 21/01/2024.
//

import SwiftUI

struct ActivityView: View {
    @State var activity: Activity
    var activities: Activities

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.title3.bold())
                Text(activity.description)
                // TODO: - make automatic plural form
                Text("Completed \(activity.activityCompletionCount) times")
                Button("Complete") {
                    if let index = activities.array.firstIndex(where: { $0.id == activity.id }) {
                        activities.array[index].activityCompletionCount += 1
//                        let removedActivity = activities.array.remove(at: index)
//                        activities.array.append(removedActivity)
                    }
                }
                .padding()
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.customb)
        .navigationTitle(activity.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    ActivityView(activity: Activity(title: "Activity title", description: "Activity descritption", activityCompletionCount: 0))
//}
