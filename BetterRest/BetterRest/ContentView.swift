//
//  ContentView.swift
//  BetterRest
//
//  Created by Tima Sikorski on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1

    @State private var showPerfectBedTimeAlert = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)

                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()

                Text("Desired amount of sleep")
                    .font(.headline)

                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)

                Text("Daily coffee intake")
                    .font(.headline)

                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
            }
            .padding()
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
            .alert("Your perfect bed time", isPresented: $showPerfectBedTimeAlert) {
                Button("OK") {}
            }
        }
    }

    func calculateBedtime() {
        showPerfectBedTimeAlert = true
    }
}

#Preview {
    ContentView()
}
