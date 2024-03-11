//
//  MainView.swift
//  Bucket List
//
//  Created by Tima Sikorski on 06/03/2024.
//

import SwiftUI
import MapKit

struct MainView: View {
    @State private var viewModel = ViewModel()

    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )

    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(initialPosition: startPosition) {
                    if viewModel.isUnlocked {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                }
                .mapStyle(viewModel.isHybridModeEnabled ? .hybrid : .standard)
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local) {
                        viewModel.addLocation(coordinate: coordinate)
                    }
                }
                .sheet(item: $viewModel.selectedPlace) { place in
                    EditView(location: place) {
                        viewModel.updateLocation($0)
                    }
                }
            }
            if (!viewModel.isUnlocked) {
                Button("Unlock Places", action: viewModel.authenticate)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
            VStack {
                VStack(alignment: .trailing){
                    Toggle("Map mode", isOn: $viewModel.isHybridModeEnabled)
                    Text(viewModel.isHybridModeEnabled ? "hybrid" : "standard")
                        .font(.caption)
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 8))
                .padding()

                Spacer()
            }
        }
    }
}

#Preview {
    MainView()
}
