//
//  PathContentView.swift
//  Navigation
//
//  Created by Tima Sikorski on 19/01/2024.
//

import SwiftUI

struct PathContentView: View {
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }

                Button("Show 64") {
                    path.append(64)
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    PathContentView()
}
