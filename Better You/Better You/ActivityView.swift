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
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Description")
                Text(activity.description)
            }
            .padding()
            .frame(width: .infinity)
            .navigationTitle(activity.title)
        }
    }
}

#Preview {
    ActivityView(activity: Activity(title: "Activity title", description: "Activity descritption"))
}
