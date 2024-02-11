//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Tima Sikorski on 02/02/2024.
//

import SwiftUI

struct AddressView: View {
    @Environment(\.scenePhase) private var scenePhase

    @Bindable var order: Order

    @State private var shouldNavigate = false

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.address.name)
                TextField("Street Address", text: $order.address.streetAddress)
                TextField("City", text: $order.address.city)
                TextField("Zip", text: $order.address.zip)
            }

            NavigationLink("Check out") {
                CheckoutView(order: order)
            }
            .disabled(!order.address.isValid)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear(perform: saveAddress)
        .onAppear(perform: fetchAddress)
        .onChange(of: scenePhase) { _, newScenePhase in
            if newScenePhase == .background {
                saveAddress()
            }
        }
    }

    func saveAddress() {
        if let encoded = try? JSONEncoder().encode(order.address) {
            UserDefaults.standard.set(encoded, forKey: "address")
        }
    }

    func fetchAddress() {
        if let data = UserDefaults.standard.data(forKey: "address"),
           let decoded = try? JSONDecoder().decode(Address.self, from: data) {
            order.address = decoded
        }
    }
}

#Preview {
    AddressView(order: Order())
}
