//
//  Order.swift
//  CupcakeCorner
//
//  Created by Tima Sikorski on 07/02/2024.
//

import SwiftUI
import Observation

struct Address: Codable {
//    enum CodingKeys: String, CodingKey {
//        case _name = "name"
//        case _city = "city"
//        case _streetAddress = "streetAddress"
//        case _zip = "zip"
//    }

    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""


    var isValid: Bool {
//        let isNameEmpty = name.components(separatedBy: .whitespaces).joined().isEmpty
//        let isStreetAdressEmpty = streetAddress.components(separatedBy: .whitespaces).joined().isEmpty
//        let isCityEmpty = city.components(separatedBy: .whitespaces).joined().isEmpty
//        let isZipEmpty = zip.components(separatedBy: .whitespaces).joined().isEmpty
//
//        if isNameEmpty || isStreetAdressEmpty || isCityEmpty || isZipEmpty {
//            return false
//        }

        return true
    }
}

@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _address = "address"
    }

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]

    var type = 0
    var quantity = 3

    var extraFrosting = false
    var addSprinkles = false

    var address: Address {
        set {
            if let encoded = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(encoded, forKey: "address")
            }
        }
        get {
            if let data = UserDefaults.standard.data(forKey: "address"),
               let decoded = try? JSONDecoder().decode(Address.self, from: data) {
                return decoded
            } else {
                return Address()
            }
        }
    }

    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
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
