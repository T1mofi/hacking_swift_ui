//
//  CodableDataContentView.swift
//  Moonshot
//
//  Created by Tima Sikorski on 14/01/2024.
//

import SwiftUI

struct GridLayoutContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 20, maximum: 120))
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    GridLayoutContentView()
}

