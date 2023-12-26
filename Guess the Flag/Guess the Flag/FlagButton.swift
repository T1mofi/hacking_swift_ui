//
//  FlagButton.swift
//  Guess the Flag
//
//  Created by Tima Sikorski on 26/12/2023.
//

import SwiftUI


private struct UnselectedModifier: ViewModifier {
    var unselected = true

    func body(content: Content) -> some View {
        content
            .opacity(unselected ? 0.3 : 1.0)
            .scaleEffect(unselected ? 0.8 : 1.0)
            .animation(.default, value: unselected)
    }
}

struct FlagButton: View {
    var imageName: String
    var action: () -> Void
    var animationCompletion: () -> Void

    @State private var animationRotationAngle = 0.0

    var body: some View {
        Button {
            action()
            withAnimation(.default, {
                animationRotationAngle += Double.pi * 2
            }, completion: animationCompletion)
        } label: {
            Image(imageName)
                .clipShape(.rect(cornerRadius: 8))
                .shadow(radius: 4)
                .rotation3DEffect(Angle.radians(animationRotationAngle), axis: (x: 0, y: 1, z: 0))
        }
    }

    func unselected(_ unselected: Bool) -> some View {
        return modifier(UnselectedModifier(unselected: unselected))
    }
}
