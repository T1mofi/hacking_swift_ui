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
    }

    @State private var wakeUp = Constants.defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var isPerfectBedTimeAlertShown = false

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
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert(alertTitle, isPresented: $isPerfectBedTimeAlertShown) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
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
            let sleepTime = wakeUp - prediction.actualSleep

            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        isPerfectBedTimeAlertShown = true
    }
}

#Preview {
    ContentView()
}
