//
//  SwipeActionsView.swift
//  Hot Prospects
//
//  Created by Tima Sikorski on 20/03/2024.
//

import SwiftUI

struct SwipeActionsView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions(edge: .leading) {
                    Button("Send message", systemImage: "message") {
                        print("Hi")
                    }
                    .tint(.blue)
                    Button("Call", systemImage: "phone") {
                        print("Ring")
                    }
                    .tint(.green)
                }
                .swipeActions(edge: .trailing) {
                    Button("Delete", systemImage: "trash", role: .destructive) {
                        print("delete")
                    }
                }
        }
    }
}

#Preview {
    SwipeActionsView()
}
