//
//  ContentView.swift
//  iExpense
//
//  Created by Tima Sikorski on 29/12/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    static let personalType = ExpenseType.personal.rawValue
    @Query(filter: #Predicate<Expense>{ expense in
        expense.rawType == personalType
    }) var expenses: [Expense]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.filter({ item in
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
                    ForEach(expenses.filter({ item in
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
                    AddView()
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
        for offset in offsets {
            let item = expenses.filter({ item in item.type == expenseType })[offset]
            modelContext.delete(item)
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
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Expense.self, configurations: config)
        return ContentView()
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
