//
//  Expense.swift
//  iExpense
//
//  Created by Tima Sikorski on 18/02/2024.
//

import Foundation
import SwiftData

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

@Model
class Expense {
    let name: String
    let type: ExpenseType
    let amount: Int

    init(name: String, type: ExpenseType, amount: Int) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
