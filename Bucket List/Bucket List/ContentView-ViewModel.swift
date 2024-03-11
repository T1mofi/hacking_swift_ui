//
//  ContentView-ViewModel.swift
//  Bucket List
//
//  Created by Tima Sikorski on 08/03/2024.
//

import Foundation
import MapKit
import Observation
import LocalAuthentication

extension MainView {
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedPlace: Location?

        var isUnlocked = false
        var isHybridModeEnabled = false
        var showingAuthentificationErrorAlert = false

        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")

        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }

        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("There was an error showing locations")
            }
        }

        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, authenticationError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.showingAuthentificationErrorAlert = true
                    }
                }
            } else {
                // no auth
            }
        }

        func addLocation(coordinate: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: coordinate.latitude, longitude: coordinate.longitude)
            locations.append(newLocation)
            save()
        }

        func updateLocation(_ location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
    }
}
