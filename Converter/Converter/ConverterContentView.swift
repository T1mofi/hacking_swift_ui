//
//  ConverterContentView.swift
//  Converter
//
//  Created by Tima Sikorski on 01/12/2023.
//

import SwiftUI

struct ConverterContentView: View {
    struct Constants {
        static var plnToEurConversionRate = 0.23
    }

    @FocusState private var textFieldFocused: Bool

    @State private var firstCurrencyAmount = 1.0
    @State private var secondCurrencyAmount: Double = 1.0 * Constants.plnToEurConversionRate

    private var fistCurrencyCode = "PLN"
    private var secondCurrencyCode = "EUR"

    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    TextField("Amount", value: $firstCurrencyAmount, format: .number)
                        .keyboardType(.numberPad)
                        .focused($textFieldFocused)
                        .onChange(of: firstCurrencyAmount) {
                            secondCurrencyAmount = firstCurrencyAmount * Constants.plnToEurConversionRate
                        }
                }

                Section("To") {
                    Text(secondCurrencyAmount, format: .currency(code: secondCurrencyCode))
                }
            }
            .onTapGesture {
                textFieldFocused = false
            }
        }
    }
}

#Preview {
    ConverterContentView()
}
