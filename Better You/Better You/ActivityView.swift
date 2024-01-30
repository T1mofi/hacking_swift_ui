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
                    .font(.title.bold())
                    .padding(.bottom, 5)
                Text(activity.description)

                Separator()

                VStack(spacing: 20) {
                    Text("Completed \(activity.activityCompletionCount) times")

                    Button("Complete") {
                        if let index = activities.items.firstIndex(where: { $0.id == activity.id }) {
                            activity.activityCompletionCount += 1
                            activities.items[index] = activity
                        }
                    }
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.darkBackground)
        .navigationTitle(activity.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let activity = Activity(title: "Hacking with Swift", description: "Every day write absolutely any amount of Swift code for yourself. Enjoy it. Have fun. And grow. Treat it as an opportunity e.g. I’ve got to have some fun coding.", activityCompletionCount: 0)
    return ActivityView(activity: activity, activities: Activities(array: [activity])).preferredColorScheme(.dark)
}
