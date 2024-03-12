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
            center: CLLocationCoordinate2D(latitude: 52.25058644896541, longitude: 21.014747064600865),
            span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
        )
    )

    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(initialPosition: startPosition) {
                    if viewModel.isUnlocked {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "pin.fill")
                                    .foregroundStyle(.red)
                                    .font(.title)
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
                Button("Unlock my Places", action: viewModel.authenticate)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
            VStack {
                VStack(alignment: .trailing){
                    Toggle("Hybrid mode", isOn: $viewModel.isHybridModeEnabled)
                }
                .padding()
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 8))
                .padding()

                Spacer()
            }
        }
        .alert("Authentification failed", isPresented: $viewModel.showingAuthentificationErrorAlert, actions: {})
    }
}

#Preview {
    MainView()
}
