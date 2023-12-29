//
//  ContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI

@Observable
class Car {
    var make: String
    var model: String

    init(make: String, model: String) {
        self.make = make
        self.model = model
    }
}

struct ContentView: View {
    @State private var car: Car = Car(make: "", model: "")

    var body: some View {
        VStack {
            TextField("Make", text: $car.make)
            TextField("Model", text: $car.model)

            Spacer()

            Text("Calculating the price for \(car.make) \(car.model)")

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
