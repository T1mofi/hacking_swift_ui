//
//  MultilineTextView.swift
//  BookWorm
//
//  Created by Tima Sikorski on 10/02/2024.
//

import SwiftUI

struct MultilineTextView: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            VStack {
                Section {
                    TextEditor(text: $notes)
                }

                Section {
                    TextField("Enter your text", text: $notes, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .navigationTitle("Notes")
                        .padding()
                }
            }
        }
    }
}

#Preview {
    MultilineTextView()
}
