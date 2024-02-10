//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Tima Sikorski on 02/02/2024.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.address.name)
                TextField("Street Address", text: $order.address.streetAddress)
                TextField("City", text: $order.address.city)
                TextField("Zip", text: $order.address.zip)
            }

            Section {
                NavigationLink("Check out") {
                    CheckoutView(order: order)
                }
            }
            .disabled(!order.address.isValid)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(order: Order())
}
