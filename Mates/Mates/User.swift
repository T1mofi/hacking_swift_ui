//
//  User.swift
//  Mates
//
//  Created by Tima Sikorski on 19/02/2024.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var age: Int
    var company: String
    var friends: [Friend]
}
