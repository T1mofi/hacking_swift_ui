//
//  Activity.swift
//  Better You
//
//  Created by Tima Sikorski on 21/01/2024.
//

import Foundation

struct Activity: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

@Observable
class Activities {
    var array: [Activity]

    init(array: [Activity]) {
        self.array = array
    }
}
