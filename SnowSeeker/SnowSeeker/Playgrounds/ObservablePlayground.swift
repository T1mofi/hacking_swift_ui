//
//  ObservablePlayground.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 07/04/2024.
//

import SwiftUI
import Observation

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player

    var body: some View {
        Text("Your high score: \(player.highScore)")
    }
}

struct ObservablePlayground: View {
    @State private var player = Player()

    var body: some View {
        VStack {
            Text("Welcome!")
            HighScoreView()
        }
        .environment(player)    }
}

#Preview {
    ObservablePlayground()
}
