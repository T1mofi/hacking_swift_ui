//
//  ContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI
import Observation

enum ExpenseType: Codable {
    case personal
    case business

    var description: String {
        switch self {
        case .personal:
            "Personal"
        case .business:
            "Business"
        }
    }
}

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: ExpenseType
    let amount: Int
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }

    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter({ item in
                        item.type == .personal
                    })) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type.description)
                            }

                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundStyle(colorForAmount(item.amount))
                        }
                    }
                    .onDelete(perform: removePersonalItems)
                }
                Section("Business") {
                    ForEach(expenses.items.filter({ item in
                        item.type == .business
                    })) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type.description)
                            }

                            Spacer()
                            Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                .foregroundStyle(colorForAmount(item.amount))
                        }
                    }
                    .onDelete(perform: removeBusinessItems)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink("Add Expense") {
                    AddView(expenses: expenses)
                }
                EditButton()
            }
        }
    }

    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, expenseType: .personal)
    }

    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, expenseType: .business)
    }

    func removeItems(at offsets: IndexSet, expenseType: ExpenseType) {
        for index in offsets {
            let item = expenses.items.filter({ item in item.type == expenseType })[index]
            if let sectionIndex = expenses.items.firstIndex(of: item) {
                expenses.items.remove(at: sectionIndex)
            }
        }
    }

    func colorForAmount(_ amount: Int) -> Color {
        switch amount {
        case 10...100:
            return .green
        case 100...:
            return .red
        default:
            return .black
        }
    }
}

#Preview {
    ContentView()
}
