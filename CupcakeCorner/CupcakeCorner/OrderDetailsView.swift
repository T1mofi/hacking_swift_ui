//
//  OrderDetailsView.swift
//  CupcakeCorner
//
//  Created by Tima Sikorski on 02/02/2024.
//

import SwiftUI
import Observation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
}

struct OrderDetailsView: View {
    @State private var order = Order()

    var body: some View {
        NavigationStack {
            Section {
                Picker("Select your cake type", selection: $order.type) {
                    ForEach(Order.types.indices, id: \.self) { type in
                        Text(Order.types[type])
                    }
                }

                Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
            }
            Section {
                Toggle("Any special requests?", isOn: $order.specialRequestEnabled)

                if order.specialRequestEnabled {
                    Toggle("Add extra frosting", isOn: $order.extraFrosting)
                    Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                }
            }
            NavigationLink("Delivery details") {
                AddressView(order: order)
            }
        }
        .navigationTitle("Cupcake Corner")
    }
}

#Preview {
    OrderDetailsView()
}
