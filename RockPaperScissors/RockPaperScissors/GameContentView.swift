//
//  GameContentView.swift
//  RockPaperScissors
//
//  Created by Tima Sikorski on 12/12/2023.
//

import SwiftUI

struct GameContentView: View {
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

    @ViewBuilder var userControlsView: some View {
        VStack {
            Text("Your choice")
                .font(.title)
                .foregroundStyle(.white)
            HStack(spacing: 50) {
                ForEach(choices, id: \.self) { choice in
                    ChoiceButton(imageName: choice.imageName) {
                        playRound(choice)
                    }
                }
            }
        }
        .padding(30)
        .background(Material.ultraThinMaterial.opacity(0.3))
        .clipShape(.rect(cornerRadius: 12))
    }

    @ViewBuilder var computersChoiceView: some View {
        Text("Computer's choice")
            .font(.title)
            .foregroundStyle(.white)
        Spacer()
        Image(appsChoice.imageName)
            .shadow(radius: 5)
    }

    @ViewBuilder var gameStatsInfoView: some View {
        VStack {
            Text("Score: \(score)")
                .foregroundStyle(.secondary)
            Text("Round: \(round)")
                .foregroundStyle(.secondary)
        }
        .padding(8)
        .background(Material.ultraThinMaterial.opacity(0.1))
        .clipShape(.rect(cornerRadius: 4))
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                computersChoiceView

                Spacer()
                Spacer()

                userControlsView

                Spacer()

                gameStatsInfoView
            }
            .padding()

            .alert(roundResult.description, isPresented: $isRoundResultAlertShown, actions: {
                Button("Continue") {
                    startNextRound()
                }
            })
            .alert("Game over", isPresented: $isEndOfGameAlertShown, actions: {
                Button("Start over") {
                    restartGame()
                }
            }) {
                Text(gameOverMessage)
            }
        }
    }
}

// MARK: - Private functions

private extension GameContentView {
    func startNextRound() {
        appsChoice = .undefinded
        round += 1
    }

    func restartGame() {
        appsChoice = .undefinded
        appsScore = 0
        score = 0
        round = 1
    }

    func playRound(_ playersChoice: Choice) {
        guard let computersChoice = choices.randomElement() else { return }
        appsChoice = computersChoice
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

        showRoundOrGameResults(appsScore: newAppsScore, score: score)
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

    func showRoundOrGameResults(appsScore: Int, score: Int)  {
        if score >= 2 {
            gameOverMessage = "You won the game"
            isEndOfGameAlertShown = true
        } else if appsScore >= 2 {
            gameOverMessage = "Computer won the game"
            isEndOfGameAlertShown = true
        } else {
            isRoundResultAlertShown = true
        }
    }
}

#Preview {
    GameContentView()
}
