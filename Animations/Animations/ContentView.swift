//
//  ContentView.swift
//  Animations
//
//  Created by Tima Sikorski on 25/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var position = CGPoint.zero
    @State private var positionBeforeDrag = CGPoint.zero

    var body: some View {
        LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .position(position)
            .gesture(
                DragGesture()
                    .onChanged {
                        position.x = positionBeforeDrag.x + $0.translation.width
                        position.y = positionBeforeDrag.y + $0.translation.height
                    }
                    .onEnded { _ in positionBeforeDrag = position}
            )
            .gesture(
                TapGesture(count: 2)
                    .onEnded {
                        withAnimation(.bouncy) {
                            position = CGPoint(x: 200, y: 200)
                        }
                    }
            )
    }
}

#Preview {
    ContentView()
}
