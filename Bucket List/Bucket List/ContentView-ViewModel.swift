//
//  ContentView-ViewModel.swift
//  Bucket List
//
//  Created by Tima Sikorski on 08/03/2024.
//

import Foundation
import MapKit
import Observation

extension MainView {
    @Observable
    class ViewModel {
        private(set) var locations = [Location]()
        var selectedPlace: Location?
    }
}
