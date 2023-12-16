//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Tima Sikorski on 12/12/2023.
//

import SwiftUI

struct ContentView: View {
    struct Constants {
        static let computerThinkingImage = "question-mark"
    }

    private var choices = ["Rock", "Paper", "Scissors"]
    @State private var appsChoice: String = Constants.computerThinkingImage
    private var score: Int = 0
    private var round: Int = 0

    @State private var shouldShowWinAlert: Bool = false
    @State private var shouldShowLoseAlert: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Computer's choice")
                    .font(.title)
                    .foregroundStyle(.white)
                Image(appsChoice.lowercased())

                Spacer()
                Spacer()

                Text("Your choice")
                    .font(.title)
                    .foregroundStyle(.white)
                HStack(spacing: 50) {
                    ForEach(choices, id: \.self) { choice in
                        Button {
                            playRound(choice)
                        } label: {
                            Image(choice.lowercased())
                        }
                    }
                }

                Spacer()

                VStack {
                    Text("Score: \(score)")
                    Text("Round: \(round)")
                }
            }
            .padding()

            .alert("Congrats!", isPresented: $shouldShowWinAlert, actions: {
                Button("Continue") {
                    appsChoice = Constants.computerThinkingImage
                }
            })
            .alert("Oops!", isPresented: $shouldShowLoseAlert, actions: {
                Button("Continue") {
                    appsChoice = Constants.computerThinkingImage
                }
            })
        }
    }

    func playRound(_ choice: String) {
        guard let computersChoice = choices.randomElement() else { return }
        appsChoice = computersChoice
        if (appsChoice.lowercased() == choice.lowercased()) {
            shouldShowWinAlert = true
        } else {
            shouldShowLoseAlert = true
        }
    }
}

#Preview {
    ContentView()
}
