//
//  ProspectEditingView.swift
//  Hot Prospects
//
//  Created by Tima Sikorski on 24/03/2024.
//

import SwiftUI

struct ProspectEditingView: View {
    @Bindable private var prospect: Prospect

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $prospect.name)
                    .textContentType(.name)
                    .font(.title2)

                TextField("Email address", text: $prospect.emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title2)
                    .autocapitalization(.none)
            }
            .navigationTitle("Edit")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    init(prospect: Prospect) {
        self.prospect = prospect
    }
}

#Preview {
    ProspectEditingView(prospect: Prospect(name: "Tim", emailAddress: "tim@apple.com", isContacted: true))
        .modelContainer(for: Prospect.self)
}
