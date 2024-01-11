//
//  ContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI
import Observation

struct Car: Codable, Identifiable {
    var id = UUID()
    var make: String = ""
    var model: String = ""
}

struct ContentView: View {
    @State private var car: Car = Car()
    @State private var isCarViewPresented = false
    @State private var ids: [UUID] = []
    @AppStorage("tapCount") private var numberOfCars = 0

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
                Button("Add") {
                    numberOfCars += 1
                    UserDefaults.standard.set(numberOfCars, forKey: "Tap")

                    ids.append(car.id)
                    UserDefaults.standard.set(ids, forKey: "ids")

                    if let carData = try? JSONEncoder().encode(car) {
                        UserDefaults.standard.set(carData, forKey: "\(car.id)")
                    }
                    isCarViewPresented = true
                }
                .padding(8)
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 8))
                Text("tapCount: \(numberOfCars)")
            }
            .padding()

            .sheet(isPresented: $isCarViewPresented) {
                CarContentView(cars: fetchCars())
            }
        }
    }

    func fetchCars() -> [Car] {
        var cars:[Car] = []
        guard let ids = UserDefaults.standard.array(forKey: "ids") else { return [] }
        for id in ids {
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
