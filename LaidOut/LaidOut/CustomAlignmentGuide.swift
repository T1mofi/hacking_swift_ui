//
//  CustomAlignmentGuide.swift
//  LaidOut
//
//  Created by Tima Sikorski on 27/03/2024.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuide: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .green], startPoint: .top, endPoint: .bottom)
            HStack {
                VStack {
                    Text("@t1mofi")
                        .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    Image(.tima)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 64, height: 64)
                        .clipShape(.circle)
                        .clipped()
                }

                VStack {
                    Text("Full name:")
                    Text("Tima Sikorski")
                        .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                        .font(.largeTitle)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    CustomAlignmentGuide()
}
