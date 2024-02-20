//
//  Friend.swift
//  Mates
//
//  Created by Tima Sikorski on 19/02/2024.
//

import Foundation
import SwiftData

@Model
class Friend: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case id
        case name
    }

    var id: String
    var name: String

//    init(id: String, name: String) {
//        self.id = id
//        self.name = name
//    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
    }
}
