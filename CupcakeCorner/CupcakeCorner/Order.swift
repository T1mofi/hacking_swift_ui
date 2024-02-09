//
//  Order.swift
//  CupcakeCorner
//
//  Created by Tima Sikorski on 07/02/2024.
//

import SwiftUI
import Observation

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var extraFrosting = false
    var addSprinkles = false

    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }

    var hasValidAddress: Bool {
        let isNameEmpty = name.components(separatedBy: .whitespaces).joined().isEmpty
        let isStreetAdressEmpty = streetAddress.components(separatedBy: .whitespaces).joined().isEmpty
        let isCityEmpty = city.components(separatedBy: .whitespaces).joined().isEmpty
        let isZipEmpty = zip.components(separatedBy: .whitespaces).joined().isEmpty
        
        if isNameEmpty || isStreetAdressEmpty || isCityEmpty || isZipEmpty {
            return false
        }

        return true
    }

    var cost: Double {
        // $2 per cake
        var cost = Double(quantity) * 2

        // complicated cakes cost more
        cost += (Double(type) / 2)

        // $1/cake for extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }

        // $0.50/cake for sprinkles
        if addSprinkles {
            cost += Double(quantity) / 2
        }

        return cost
    }
}
