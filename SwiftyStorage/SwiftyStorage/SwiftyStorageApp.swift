//
//  SwiftyStorageApp.swift
//  SwiftyStorage
//
//  Created by Tima Sikorski on 15/02/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftyStorageApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
