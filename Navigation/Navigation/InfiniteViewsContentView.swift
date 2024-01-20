//
//  InfiniteViewsContentView.swift
//  Navigation
//
//  Created by Tima Sikorski on 20/01/2024.
//

import SwiftUI

struct InfiniteViewsContentView: View {
    @State private var pathStore = PathStore()

    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $pathStore.path)
                }
        }
    }
}

#Preview {
    InfiniteViewsContentView()
}
