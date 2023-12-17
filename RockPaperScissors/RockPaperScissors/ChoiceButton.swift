//
//  ChoiceButton.swift
//  RockPaperScissors
//
//  Created by Tima Sikorski on 17/12/2023.
//

import SwiftUI

struct ChoiceButton: View {
    var imageName: String
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(imageName)
                .shadow(radius: 5)
        }
    }
}
