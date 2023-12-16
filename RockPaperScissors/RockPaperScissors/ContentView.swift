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

    enum RoundResult {
        case computerWon
        case playerWon
        case parity

        var description: String {
            switch self {
            case .computerWon:
                "Computer Won"
            case .playerWon:
                "You won"
            case .parity:
                "Parity"
            }
        }
    }

    private var choices = ["rock", "paper", "scissors"]
    @State private var appsChoice: String = Constants.computerThinkingImage
    private var score: Int = 0
    private var round: Int = 0

    @State private var isRoundResultAlertShown: Bool = false
    @State private var roundResult: RoundResult = .parity

    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Computer's choice")
                    .font(.title)
                    .foregroundStyle(.white)

                Spacer()

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


            .alert(roundResult.description, isPresented: $isRoundResultAlertShown, actions: {
                Button("Continue") {
                    appsChoice = Constants.computerThinkingImage
                }
            })
        }
    }

    func playRound(_ choice: String) {
        guard let computersChoice = choices.randomElement() else { return }
        appsChoice = computersChoice
        roundResult = checkRoundResult(playersChoice: choice, computersChoice: appsChoice)
        isRoundResultAlertShown = true
    }

    func checkRoundResult(playersChoice: String, computersChoice: String) -> RoundResult {
        if playersChoice == computersChoice {
            return .parity
        }

        switch playersChoice {
        case "rock":
            return computersChoice == "paper" ? .computerWon : .playerWon
        case "paper":
            return computersChoice == "scissors" ? .computerWon : .playerWon
        case "scissors":
            return computersChoice == "rock" ? .computerWon : .playerWon
        default:
            fatalError("unknown player choice")
        }
    }
}

#Preview {
    ContentView()
}
