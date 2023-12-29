//
//  ContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI
import Observation

@Observable
class Car {
    var make: String = ""
    var model: String = ""
}

struct ContentView: View {
    @State private var car: Car = Car()
    @State private var isCarViewPresented = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .indigo], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Enter your car details")
                    .font(.title)
                    .foregroundStyle(.white)
                VStack {
                    TextField("Make", text: $car.make)

                    TextField("Model", text: $car.model)
                }
                .padding(8)
                .background()
                .clipShape(.rect(cornerRadius: 8))
                Button("Done") {
                    isCarViewPresented = true
                }
                .padding(8)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 8))
            }
            .padding()

            .sheet(isPresented: $isCarViewPresented) {
                CarContentView(car: car)
            }
        }
    }
}

#Preview {
    ContentView()
}
