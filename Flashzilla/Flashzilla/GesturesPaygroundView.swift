//
//  GesturesPaygroundView.swift
//  Flashzilla
//
//  Created by Tima Sikorski on 24/03/2024.
//

import SwiftUI

struct GesturesPaygroundView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0

    @State private var currentAngle = Angle.zero
    @State private var finalAngle = Angle.zero

    var body: some View {
        Text("Hello, world!")
            .onTapGesture(count: 2) {
                print("DoupleTap recognized")
            }
            .onLongPressGesture(minimumDuration: 3) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress: \(inProgress)!")
            }
//            .scaleEffect(finalAmount + currentAmount)
//            .gesture(
//                MagnifyGesture()
//                    .onChanged { value in
//                        currentAmount = value.magnification - 1
//                    }
//                    .onEnded { value in
//                        finalAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
            .rotationEffect(currentAngle + finalAngle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAngle = value.rotation
                    }
                    .onEnded { value in
                        finalAngle += currentAngle
                        currentAngle = .zero
                    }
            )
    }
}

#Preview {
    GesturesPaygroundView()
}
