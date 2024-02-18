//
//  Expense.swift
//  iExpense
//
//  Created by Tima Sikorski on 18/02/2024.
//

import Foundation
import SwiftData

enum ExpenseType: Int, Codable {
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
    let rawType: Int
    let amount: Int

    var type: ExpenseType {
        return ExpenseType(rawValue: rawType)!
    }

    init(name: String, type: ExpenseType, amount: Int) {
        self.name = name
        self.rawType = type.rawValue
        self.amount = amount
    }
}
