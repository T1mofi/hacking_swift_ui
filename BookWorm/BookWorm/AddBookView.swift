//
//  AddBookView.swift
//  BookWorm
//
//  Created by Tima Sikorski on 11/02/2024.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    @State var title: String = ""
    @State var author: String = ""
    @State var genre: String = "Fantasy"
    @State var review: String = ""
    @State var rating: Int = 3

    var shouldDisableSaving: Bool {
        title.isEmpty ||
        author.isEmpty
    }

    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)

                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }

                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                }

                Section {
                    Button("Save") {
                        let newBook = Book(id: UUID(), title: title, author: author, genre: genre, review: review, rating: rating, dataAdded: Date())
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(shouldDisableSaving)
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
