//
//  WikipediaResult.swift
//  Bucket List
//
//  Created by Tima Sikorski on 07/03/2024.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
