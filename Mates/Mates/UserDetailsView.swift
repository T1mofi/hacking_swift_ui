//
//  UserDetailsView.swift
//  Mates
//
//  Created by Tima Sikorski on 19/02/2024.
//

import SwiftUI
import SwiftData

struct UserDetailsView: View {
    var user: User

    var body: some View {
        VStack {
            VStack {
                Text(user.name)
                    .font(.title)
                    .fontWeight(.semibold)
                Text(user.company)
                Text("\(user.age) y.o.")
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                            .padding()
                            .background(.blue)
                            .clipShape(.capsule)
                            .overlay(
                                Capsule()
                                    .strokeBorder(.black, lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal)
            }

            Spacer()
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)

        let user = User(id: "1",
                        name: "Tima",
                        age: 24, company: "Scandit", dateRegistered: .now,
                        friends: [])
        return UserDetailsView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container \(error.localizedDescription)")
    }

}
