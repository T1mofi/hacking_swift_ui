//
//  ContentView.swift
//  Moonshot
//
//  Created by Tima Sikorski on 14/01/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.lego)
                .resizable()
                .scaledToFit()
                .containerRelativeFrame(.horizontal) { size, axis in
                    size * 0.6
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
