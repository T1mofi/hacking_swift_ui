//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Tima Sikorski on 02/02/2024.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    @State var address: Address = {
        if let data = UserDefaults.standard.data(forKey: "address"),
           let decoded = try? JSONDecoder().decode(Address.self, from: data) {
            return decoded
        } else {
            return Address()
        }
    }()

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
                    if let encoded = try? JSONEncoder().encode(address) {
                        UserDefaults.standard.set(encoded, forKey: "address")
                    }
                    order.address = address
                    shouldNavigate = true
                }
            }
            .disabled(!address.isValid)

            NavigationLink("Check out", isActive: $shouldNavigate) {
                CheckoutView(order: order)
            }
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
