//
//  ContentView.swift
//  BetterRest
//
//  Created by Tima Sikorski on 17/12/2023.
//

import CoreML
import SwiftUI

struct ContentView: View {
    struct Constants {
        static let defaultWakeTime: Date = {
            var components = DateComponents()
            components.hour = 7
            components.minute = 0
            return Calendar.current.date(from: components) ?? .now
        }()
        static let defaultBedTime: Date = {
            var components = DateComponents()
            components.hour = 23
            components.minute = 0
            return Calendar.current.date(from: components) ?? .now
        }()
    }

    @State private var wakeUp = Constants.defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var bedTime: Date = Constants.defaultBedTime
    @State private var recomendedBedTimeMessage: String = ""

    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 5) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }


                VStack(alignment: .leading, spacing: 5) {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Stepper("^[\(coffeeAmount) cup](inflect:true)", value: $coffeeAmount, in: 1...20)
                }

                Section {
                    Text(recomendedBedTimeMessage)
                }
            }
            .scrollContentBackground(.hidden)
            .background(LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing))
            .onChange(of: wakeUp, initial: true) {
                calculateBedtime()
            }
            .onChange(of: sleepAmount, initial: true) {
                calculateBedtime()
            }
            .onChange(of: coffeeAmount, initial: true) {
                calculateBedtime()
            }
            .navigationTitle("BetterRest")
        }
    }

    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try BetterRestRegressor(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Int64(hour + minute), estimatedSleep: sleepAmount, coffee: Int64(coffeeAmount))
            bedTime = wakeUp - prediction.actualSleep
            recomendedBedTimeMessage = "Your ideal bedtime is \(bedTime.formatted(date: .omitted, time: .shortened))"
        } catch {
            recomendedBedTimeMessage = "Error occured, can't calculate bed time..."
        }
    }
}

#Preview {
    ContentView()
}
