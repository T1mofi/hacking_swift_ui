//
//  AddView.swift
//  iExpense
//
//  Created by Tima Sikorski on 13/01/2024.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss

    var expenses: Expenses

    @State private var name = ""
    @State private var type: ExpenseType = .personal
    @State private var amount = 0

    let types: [ExpenseType] = [.business, .personal]

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0.description)
                    }
                }

                TextField("Amount", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
