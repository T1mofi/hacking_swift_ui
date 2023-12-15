//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Tima Sikorski on 12/12/2023.
//

import SwiftUI

struct ContentView: View {
    var choices = ["Rock", "Paper", "Scissors"]
    var appsChoice: String {
        choices.randomElement() ?? ""
    }
    var score: Int = 0
    var round: Int = 0

    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Computer's chice")
                    .font(.title)
                    .foregroundStyle(.white)
                Image("rock")
                Image(systemName: "question-mark")

                Spacer()
                Spacer()

                Text("You chice")
                    .font(.title)
                    .foregroundStyle(.white)
                HStack(spacing: 50) {
                    ForEach(choices, id: \.self) { choice in
                        Button {

                        } label: {
                            Image(choice.lowercased())
                        }
                    }
                }

                Spacer()

                Text("Score: \(score)")
                Text("Round: \(round)")
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
