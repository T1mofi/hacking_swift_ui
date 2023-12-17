//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Tima Sikorski on 12/12/2023.
//

import SwiftUI



struct ContentView: View {
    enum RoundResult {
        case computerWon
        case playerWon
        case parity

        var description: String {
            switch self {
            case .computerWon:
                "Computer Won"
            case .playerWon:
                "You've won!"
            case .parity:
                "Parity"
            }
        }
    }

    enum Choice {
        case rock
        case paper
        case scissors
        case undefinded

        var imageName: String {
            switch self {
            case .rock:
                "rock"
            case .paper:
                "paper"
            case .scissors:
                "scissors"
            case .undefinded:
                "question-mark"
            }
        }
    }

    private var choices: [Choice] = [.rock, .paper, .scissors]
    @State private var appsChoice: Choice = .undefinded
    @State private var score: Int = 0
    @State private var appsScore: Int = 0
    @State private var round: Int = 1

    @State private var isRoundResultAlertShown: Bool = false
    @State private var roundResult: RoundResult = .parity

    @State private var isEndOfGameAlertShown: Bool = false
    @State private var gameOverMessage = ""

    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Computer's choice")
                    .font(.title)
                    .foregroundStyle(.white)

                Spacer()

                Image(appsChoice.imageName)

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
                            Image(choice.imageName)
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
                    startNextRound()
                }
            })
            .alert("Game over", isPresented: $isEndOfGameAlertShown, actions: {
                Button("Continue") {
                    startNextRound()
                }
            }) {
                Text(gameOverMessage)
            }
        }
    }

    func startNextRound() {
        appsChoice = .undefinded
        round += 1
    }

    func playRound(_ playersChoice: Choice) {
//        guard let computersChoice = choices.randomElement() else { return }
//        appsChoice = computersChoice
        appsChoice = .paper
        roundResult = checkRoundResult(playersChoice: playersChoice, computersChoice: appsChoice)

        let newAppsScore = appsScore + 1
        let newScore = score + 1

        switch roundResult {
        case .computerWon:
            appsScore = newAppsScore
        case .playerWon:
            score = newScore
        case .parity:
            break
        }

        isRoundResultAlertShown = true
        endGameIfneeded(appsScore: newAppsScore, score: score)
    }

    func checkRoundResult(playersChoice: Choice, computersChoice: Choice) -> RoundResult {
        if playersChoice == computersChoice {
            return .parity
        }

        switch playersChoice {
        case .rock:
            return computersChoice == .paper ? .computerWon : .playerWon
        case .paper:
            return computersChoice == .scissors ? .computerWon : .playerWon
        case .scissors:
            return computersChoice == .rock ? .computerWon : .playerWon
        default:
            fatalError("unknown player choice")
        }
    }

    func endGameIfneeded(appsScore: Int, score: Int)  {
        if score >= 2 {
            gameOverMessage = "You won the game"
            isEndOfGameAlertShown = true
        }

        if appsScore >= 2 {
            gameOverMessage = "Computer won the game"
            isEndOfGameAlertShown = true
        }
    }
}

#Preview {
    ContentView()
}
