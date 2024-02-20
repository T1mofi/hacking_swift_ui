//
//  UsersView.swift
//  Mates
//
//  Created by Tima Sikorski on 19/02/2024.
//

import SwiftUI
import SwiftData

struct UsersView: View {
    @Query var users: [User]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            Text(String(users.count))
            List(users) { user in
                HStack {
                    NavigationLink(user.name, destination: {
                        UserDetailsView(user: user)
                    })
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Users")
        .task {
            if users.isEmpty {
                await fetchUsers()
            }
        }
    }

    func fetchUsers() async {
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            users.forEach { modelContext.insert($0) }
        } catch {
            print("failed to load the data")
        }
    }
}

#Preview {
    UsersView()
}
