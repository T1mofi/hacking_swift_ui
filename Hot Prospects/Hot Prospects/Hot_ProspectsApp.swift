//
//  Hot_ProspectsApp.swift
//  Hot Prospects
//
//  Created by Tima Sikorski on 19/03/2024.
//

import SwiftUI
import SwiftData

@main
struct Hot_ProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
