//
//  ContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI
import Observation

struct Car: Hashable {
    var make: String = ""
    var model: String = ""
}

struct ContentView: View {
    @State private var car: Car = Car()
    @State private var isCarViewPresented = false
    @AppStorage("tapCount") private var tapCount = 0

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
                    tapCount += 1
                    UserDefaults.standard.set(tapCount, forKey: "Tap")
                }
                .padding(8)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 8))
                Text("tapCount: \(tapCount)")
            }
            .padding()

            .sheet(isPresented: $isCarViewPresented) {
                CarContentView(cars: [Car(make: "BMW", model: "M3"), Car(make: "BMW", model: "M4")])
            }
        }
    }
}

#Preview {
    ContentView()
}
