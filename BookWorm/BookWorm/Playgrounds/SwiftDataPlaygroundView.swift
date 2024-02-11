//
//  SwiftDataPlaygroundView.swift
//  BookWorm
//
//  Created by Tima Sikorski on 10/02/2024.
//

import SwiftUI
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

struct SwiftDataPlaygroundView: View {
    @Environment(\.modelContext) var modelContext
    @Query var students: [Student]

    var body: some View {
        NavigationStack {
            List( students) { studnt in
                Text(studnt.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!

                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    SwiftDataPlaygroundView()
}
