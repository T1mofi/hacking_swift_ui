//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Tima Sikorski on 10/02/2024.
//

import SwiftUI
import SwiftData

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
//        .modelContainer(for: Student.self)
    }
}
