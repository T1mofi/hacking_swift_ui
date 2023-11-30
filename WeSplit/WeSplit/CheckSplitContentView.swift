//
//  CheckSplitContentView.swift
//  WeSplit
//
//  Created by Tima Sikorski on 29/11/2023.
//

import SwiftUI

struct CheckSplitContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20

    @FocusState private var amoutFieldIsFocused: Bool

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }

    var tipPercentages = [10, 15, 20, 25, 0]

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Input")) {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amoutFieldIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<5) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding()

                Section(header: Text("Result")) {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("Check split")
            .toolbar {
                Button("done") {
                    amoutFieldIsFocused = false
                }
            }
            .onTapGesture {
                amoutFieldIsFocused = false
            }
        }
    }
}
