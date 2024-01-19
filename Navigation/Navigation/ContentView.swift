//
//  ContentView.swift
//  Navigation
//
//  Created by Tima Sikorski on 19/01/2024.
//

import SwiftUI

struct Student: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List([Student(name: "Alex", age: 21), Student(name: "Aneta", age: 22)]) { student in
                NavigationLink("Select \(student.name)", value: student)
            }
            .navigationDestination(for: Student.self) { selection in
                Text("Name: \(selection.name)")
                Text("Age: \(selection.age)")
            }
        }
    }
}

#Preview {
    ContentView()
}
