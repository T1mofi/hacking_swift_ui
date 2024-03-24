//
//  AccessibilityPlayground.swift
//  Flashzilla
//
//  Created by Tima Sikorski on 24/03/2024.
//

import SwiftUI

struct AccessibilityPlayground: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0

    var body: some View {
        Button("Hello, World!") {
            withOptionalAnimation {
                scale *= 1.5
            }

        }
        .scaleEffect(scale)
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }

            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }

    func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

#Preview {
    AccessibilityPlayground()
}
