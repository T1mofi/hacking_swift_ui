//
//  Resort.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 08/04/2024.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]

    var sizeString: String {
        switch self.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }

    var priceString: String {
        String(repeating: "$", count: self.price)
    }

    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
}
