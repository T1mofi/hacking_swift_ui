//
//  User.swift
//  Mates
//
//  Created by Tima Sikorski on 19/02/2024.
//

import Foundation
import SwiftData

@Model
class User: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case age
        case company
        case dateRegistered = "registered"
        case friends
    }

    var id: String
    var name: String
    var age: Int
    var company: String
    var dateRegistered: Date
    var friends: [Friend]

    init(id: String, name: String, age: Int, company: String, dateRegistered: Date, friends: [Friend]) {
        self.id = id
        self.name = name
        self.age = age
        self.company = company
        self.dateRegistered = dateRegistered
        self.friends = friends
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.friends = try container.decode([Friend].self, forKey: .friends)
        let registrationDateString = try container.decode(String.self, forKey: .dateRegistered)
        self.dateRegistered = (try? Date(registrationDateString, strategy: .iso8601)) ?? .now
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.age, forKey: .age)
        try container.encode(self.company, forKey: .company)
        try container.encode(self.friends, forKey: .friends)
        try container.encode(self.dateRegistered.description, forKey: .dateRegistered)
    }
}
