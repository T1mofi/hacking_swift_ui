//
//  ConverterContentView.swift
//  Converter
//
//  Created by Tima Sikorski on 01/12/2023.
//

import SwiftUI

struct ConverterContentView: View {
    struct Constants {
        static let initialAmount = 1.0
        static let plnToEurConversionRate = 0.23
        static let plnToUSDConversionRate = 0.25
        static let EurToUSDConversionRate = plnToUSDConversionRate / plnToEurConversionRate
    }

    @FocusState private var textFieldFocused: Bool
    @FocusState private var secondTextFieldFocused: Bool

    @State private var firstCurrencyAmount = Constants.initialAmount
    @State private var secondCurrencyAmount: Double = Constants.initialAmount * Constants.plnToEurConversionRate
    @State private var firstCurrency = "PLN"
    @State private var secondCurrency = "EUR"

    private var currenciesList = ["PLN", "EUR", "USD"]

    private var conversionRate: Double {
        switch (firstCurrency, secondCurrency) {
        case ("PLN", "EUR"):
            return Constants.plnToEurConversionRate
        case ("EUR", "PLN"):
            return 1 / Constants.plnToEurConversionRate
        case ("PLN", "USD"):
            return Constants.plnToUSDConversionRate
        case ("USD", "PLN"):
            return 1 / Constants.plnToUSDConversionRate
        case ("EUR", "USD"):
            return Constants.EurToUSDConversionRate
        case ("USD", "EUR"):
            return 1 / Constants.EurToUSDConversionRate
        default:
            return -1
        }

    }

    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    Picker("First Currency", selection: $firstCurrency) {
                        ForEach(currenciesList, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: firstCurrency) { oldValue, newValue in
                        if newValue == secondCurrency {
                            secondCurrency = currenciesList.first(where: {$0 != newValue}) ?? "Error"
                        }
                    }

                    TextField("Amount", value: $firstCurrencyAmount, format: .number.precision(.fractionLength(2)))
                        .keyboardType(.numberPad)
                        .focused($textFieldFocused)
                        .onChange(of: firstCurrencyAmount) {
                            secondCurrencyAmount = firstCurrencyAmount * conversionRate
                            print("firstCurrencyAmount change callback")
                        }
                }

                Section("To") {
                    Picker("First Currency", selection: $secondCurrency) {
                        ForEach(currenciesList, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: secondCurrency) { oldValue, newValue in
                        if newValue == firstCurrency {
                            firstCurrency = currenciesList.first(where: {$0 != newValue}) ?? "Error"
                        }
                    }

                    TextField("Amount", value: $secondCurrencyAmount, format: .number.precision(.fractionLength(2)))
                        .keyboardType(.numberPad)
                        .focused($secondTextFieldFocused)
                        .onChange(of: secondCurrencyAmount) {
                            firstCurrencyAmount = secondCurrencyAmount / conversionRate
                            print("secondCurrencyAmount change callback")
                        }
                }
            }
            .onTapGesture {
                textFieldFocused = false
                secondTextFieldFocused = false
            }
        }
    }
}

#Preview {
    ConverterContentView()
}
