//
//  ContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI
import Observation

struct Car: Hashable, Codable {
    var id: Int = 0
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
                    car.id = tapCount
                    UserDefaults.standard.set(tapCount, forKey: "Tap")
                    if let data = try? JSONEncoder().encode(car) {
                        UserDefaults.standard.set(data, forKey: "\(car.id)")
                    }
                }
                .padding(8)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 8))
                Text("tapCount: \(tapCount)")
            }
            .padding()

            .sheet(isPresented: $isCarViewPresented) {
                CarContentView(cars: fetchCars())
            }
        }
    }

    func fetchCars() -> [Car] {
        var cars:[Car] = []
        for id in 0...tapCount {
            if let data = UserDefaults.standard.data(forKey: "\(id)"),
               let car = try? JSONDecoder().decode(Car.self, from: data) {
                cars.append(car)
            }
        }
        return cars
    }
}

#Preview {
    ContentView()
}
