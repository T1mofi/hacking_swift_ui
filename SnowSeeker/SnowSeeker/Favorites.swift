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
        if let resortsArray = UserDefaults.standard.array(forKey: key) as? [String] {
            resorts = Set(resortsArray)
        } else {
            resorts = []
        }
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
        UserDefaults.standard.setValue(Array(resorts), forKey: key)
    }
}
