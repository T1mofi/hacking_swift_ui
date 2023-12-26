//
//  ContentView.swift
//  Animations
//
//  Created by Tima Sikorski on 25/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation(.easeInOut(duration: 2)) {
                    isShowingRed.toggle()
                }
            }

            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
            }
        }
    }
}

#Preview {
    ContentView()
}
