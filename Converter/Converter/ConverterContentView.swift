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
    }

    @FocusState private var textFieldFocused: Bool
    @FocusState private var secondTextFieldFocused: Bool

    @State private var firstCurrencyAmount = Constants.initialAmount
    @State private var secondCurrencyAmount: Double = Constants.initialAmount * Constants.plnToEurConversionRate

    private var fistCurrencyCode = "PLN"
    private var secondCurrencyCode = "EUR"

    var body: some View {
        NavigationStack {
            Form {
                Section((fistCurrencyCode)) {
                    TextField("Amount", value: $firstCurrencyAmount, format: .number.precision(.fractionLength(2)))
                        .keyboardType(.numberPad)
                        .focused($textFieldFocused)
                        .onChange(of: firstCurrencyAmount) {
                            secondCurrencyAmount = firstCurrencyAmount * Constants.plnToEurConversionRate
                            print("firstCurrencyAmount change callback")
                        }
                }

                Section(secondCurrencyCode) {
                    TextField("Amount", value: $secondCurrencyAmount, format: .number.precision(.fractionLength(2)))
                        .keyboardType(.numberPad)
                        .focused($secondTextFieldFocused)
                        .onChange(of: secondCurrencyAmount) {
                            firstCurrencyAmount = secondCurrencyAmount / Constants.plnToEurConversionRate
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
