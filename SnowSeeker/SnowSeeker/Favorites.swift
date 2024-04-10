//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 10/04/2024.
//

import SwiftUI

@Observable
class Favorites {
    private var resorts: Set<String>
    private let key = "Favorites"

    init() {
        // load our saved data

        // still here? Use an empty array
        resorts = []
    }

    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }

    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }

    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }

    func save() {
        // write out our data
    }
}
