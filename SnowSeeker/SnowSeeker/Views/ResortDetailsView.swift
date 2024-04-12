//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 08/04/2024.
//

import SwiftUI

struct ResortDetailsView: View {
    let resort: Resort

    var body: some View {
        Group {
            VStack {
                Text("Size")
                    .font(.caption.bold())
                Text(resort.sizeString)
                    .font(.title3)
            }

            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(resort.priceString)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ResortDetailsView(resort: .example)
}
