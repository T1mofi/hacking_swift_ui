//
//  OffsetVsPositionView.swift
//  LaidOut
//
//  Created by Tima Sikorski on 28/03/2024.
//

import SwiftUI

struct OffsetVsPositionView: View {
    var body: some View {
        VStack {
            ZStack {
                Color.green
                Text("Position!")
//                    .background(.red)
                    .position(x: 50, y: 50)
                    .background(.red)
            }


            ZStack {
                Color.orange
                Text("Offset!")
//                    .background(.red)
                    .offset(x: 50, y: 50)
                    .background(.red)
            }

        }
    }
}

#Preview {
    OffsetVsPositionView()
}
