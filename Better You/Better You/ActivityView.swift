//
//  ActivityView.swift
//  Better You
//
//  Created by Tima Sikorski on 21/01/2024.
//

import SwiftUI

struct ActivityView: View {
    var activity: Activity

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Description")
                    .font(.title3.bold())
                Text(activity.description)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.customb)
        .navigationTitle(activity.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ActivityView(activity: Activity(title: "Activity title", description: "Activity descritption"))
}
