//
//  UsersView.swift
//  SwiftyStorage
//
//  Created by Tima Sikorski on 16/02/2024.
//

import SwiftData
import SwiftUI

struct UsersView: View {
    @Query var users: [User]

    var body: some View {
        List(users) { user in
            Text(user.name)
        }
    }

    init(minimumJoinDate: Date, sort: [SortDescriptor<User>]) {
        _users = Query(filter: #Predicate<User>{ user in
            user.joinDate >= minimumJoinDate
        }, sort: sort)
    }
}

#Preview {
    UsersView(minimumJoinDate: .now, sort:[])
        .modelContainer(for: User.self)
}
