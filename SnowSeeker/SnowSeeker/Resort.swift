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

    static let example = (Bundle.main.decode("resorts.json") as [Resort])[0]
}
