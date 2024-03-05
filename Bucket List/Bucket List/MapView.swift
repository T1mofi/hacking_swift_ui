//
//  MapView.swift
//  Bucket List
//
//  Created by Tima Sikorski on 05/03/2024.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    @State var position = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 52.245, longitude: 21.055),
            span: MKCoordinateSpan(latitudeDelta: 0.009, longitudeDelta: 0.009)
        )
    )
    let locations = [
        Location(name: "Park Sikerkowski", coordinate: CLLocationCoordinate2D(latitude: 52.242, longitude: 21.055)),
        Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
    ]

    var body: some View {
        Map(position: $position) {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Text(location.name)
                            .font(.headline)
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                    .annotationTitles(.hidden)
                }
        }
        .mapStyle(.hybrid(elevation: .realistic))
        .onMapCameraChange { context in
            print(context.region)
        }
        HStack(spacing: 50) {
            Button("Paris") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }

            Button("Tokyo") {
                position = MapCameraPosition.region(
                    MKCoordinateRegion(
                        center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                    )
                )
            }
        }
    }
}

#Preview {
    MapView()
}
