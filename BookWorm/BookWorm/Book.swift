//
//  Book.swift
//  BookWorm
//
//  Created by Tima Sikorski on 11/02/2024.
//

import Foundation
import SwiftData

@Model
class Book {
    var id: UUID
    var title: String
    var author: String
    var genre: String
    var review: String
    var rating: Int
    var dateAdded: Date

    init(id: UUID, title: String, author: String, genre: String, review: String, rating: Int, dataAdded: Date) {
        self.id = id
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.dateAdded = dataAdded
    }
}
