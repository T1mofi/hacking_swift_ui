//
//  HitTestPlayground.swift
//  Flashzilla
//
//  Created by Tima Sikorski on 24/03/2024.
//

import SwiftUI

struct HitTestPlayground: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    HitTestPlayground()
}
