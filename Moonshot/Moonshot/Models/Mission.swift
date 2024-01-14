//
//  Mission.swift
//  Moonshot
//
//  Created by Tima Sikorski on 14/01/2024.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
