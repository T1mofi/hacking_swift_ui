//
//  UserDetailsView.swift
//  Mates
//
//  Created by Tima Sikorski on 19/02/2024.
//

import SwiftUI

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
    UserDetailsView(user: User(id: "1",
                               name: "Tima",
                               age: 24, company: "Scandit", dateRegistered: .now,
                               friends: [
                                Friend(id: "2", name: "Konrad"),
                                Friend(id: "3", name: "Liza"),
                                Friend(id: "4", name: "Nastia"),
                                Friend(id: "5", name: "Andrzej"),
                                Friend(id: "6", name: "Luca"),
                                Friend(id: "7", name: "Atte"),
                                Friend(id: "8", name: "Marco"),
                                Friend(id: "9", name: "Martin"),
                               ]))
}
