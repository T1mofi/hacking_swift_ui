//
//  ContextMenuView.swift
//  Hot Prospects
//
//  Created by Tima Sikorski on 20/03/2024.
//

import SwiftUI

struct ContextMenuView: View {
    @State private var backgroundColor = Color.red

    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(backgroundColor)

            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: "checkmark.circle.fill") {
                        backgroundColor = .red
                    }
                    .foregroundStyle(.red)

                    Button("Green") {
                        backgroundColor = .green
                    }

                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

#Preview {
    ContextMenuView()
}
