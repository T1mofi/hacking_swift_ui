//
//  ContentView.swift
//  Mates
//
//  Created by Tima Sikorski on 19/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []

    var body: some View {
        NavigationStack {
            List(users) { user in
                HStack {
                    VStack(alignment: .leading) {
                        Text(user.name)
                        Text(user.company)
                    }
                    Text(String(user.age))
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Users")
        .task {
            await fetchUsers()
        }
    }

    func fetchUsers() async {
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            users = try JSONDecoder().decode([User].self, from: data)
        } catch {
            print("failed to load the data")
        }
    }
}

#Preview {
    ContentView()
}
