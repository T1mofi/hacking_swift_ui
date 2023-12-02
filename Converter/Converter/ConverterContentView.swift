//
//  ConverterContentView.swift
//  Converter
//
//  Created by Tima Sikorski on 01/12/2023.
//

import SwiftUI

struct ConverterContentView: View {
    @State private var firstCurrency = 1.0
    @State private var secondCurrency = 1.0

    private var fistCurrencyCode = "PLN"
    private var secondCurrencyCode = "EUR"

    var body: some View {
        NavigationStack {
            Form {
                Section("From") {
                    TextField("Amount", value: $firstCurrency, format: .currency(code: fistCurrencyCode))
                        .keyboardType(.numberPad)
                }

                Section("To") {
                    TextField("Amount", value: $secondCurrency, format: .currency(code: secondCurrencyCode))
                }
            }
        }
    }
}

#Preview {
    ConverterContentView()
}
