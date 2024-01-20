//
//  InfiniteViewsContentView.swift
//  Navigation
//
//  Created by Tima Sikorski on 20/01/2024.
//

import SwiftUI

struct InfiniteViewsContentView: View {
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path: $path) {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    InfiniteViewsContentView()
}
