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
    static let businessType = ExpenseType.business.rawValue

    @Query(filter: #Predicate<Expense>{ expense in
        expense.rawType == personalType
    }) var personalExpenses: [Expense]
    @Query(filter: #Predicate<Expense>{ expense in
        expense.rawType == businessType
    }) var businessExpenses: [Expense]

    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(personalExpenses) { item in
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
                    ForEach(businessExpenses) { item in
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
        offsets.forEach { modelContext.delete(personalExpenses[$0])}
    }

    func removeBusinessItems(at offsets: IndexSet) {
        offsets.forEach { modelContext.delete(businessExpenses[$0])}
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
