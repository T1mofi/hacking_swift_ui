//
//  ImageInterpolationView.swift
//  Hot Prospects
//
//  Created by Tima Sikorski on 20/03/2024.
//

import SwiftUI

struct ImageInterpolationView: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolationView()
}
