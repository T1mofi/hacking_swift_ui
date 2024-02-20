//
//  MatesApp.swift
//  Mates
//
//  Created by Tima Sikorski on 19/02/2024.
//

import SwiftUI
import SwiftData

@main
struct MatesApp: App {
    var body: some Scene {
        WindowGroup {
            UsersView()
        }
        .modelContainer(for: User.self)
    }
}
