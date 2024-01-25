//
//  Activity.swift
//  Better You
//
//  Created by Tima Sikorski on 21/01/2024.
//

import Foundation
import Observation

struct Activity: Identifiable, Codable {
    var id = UUID()
    let title: String
    let description: String
    var activityCompletionCount: Int
}

@Observable
class Activities {
    var items: [Activity] = [Activity]() {
        didSet {
            if let encodedData = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encodedData, forKey: "activities")
            }
        }
    }

    init() {
        if let encodedData = UserDefaults.standard.data(forKey: "activities"),
           let items = try? JSONDecoder().decode([Activity].self, from: encodedData) {
            self.items = items
            return
        }

        self.items = []
    }

    init(array: [Activity]) {
        self.items = array
    }
}
