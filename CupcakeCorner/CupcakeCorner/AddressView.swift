//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Tima Sikorski on 02/02/2024.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    @State var address: Address = Address()

    @State private var shouldNavigate = false

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $address.name)
                TextField("Street Address", text: $address.streetAddress)
                TextField("City", text: $address.city)
                TextField("Zip", text: $address.zip)
            }

            Section {
                Button("Button") {
                    order.address = address
                    shouldNavigate = true
                }
            }
            .disabled(!address.isValid)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationDestination(isPresented: $shouldNavigate) {
            CheckoutView(order: order)
        }
        .onDisappear(perform: saveAddress)
        .onAppear(perform: fetchAddress)
    }

    func saveAddress() {
        if let encoded = try? JSONEncoder().encode(address) {
            UserDefaults.standard.set(encoded, forKey: "address")
        }
    }

    func fetchAddress() {
        if let data = UserDefaults.standard.data(forKey: "address"),
           let decoded = try? JSONDecoder().decode(Address.self, from: data) {
            address = decoded
        }
    }
}

#Preview {
    AddressView(order: Order())
}
