//
//  ViewThatFitsPlayground.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 07/04/2024.
//

import SwiftUI

struct ViewThatFitsPlayground: View {
    var body: some View {
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)

            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ViewThatFitsPlayground()
}
