//
//  RollerApp.swift
//  Roller
//
//  Created by Tima Sikorski on 03/04/2024.
//

import SwiftUI

@main
struct RollerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: MainModel.self)
        }
    }
}
