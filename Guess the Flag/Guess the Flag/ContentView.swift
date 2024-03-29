//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Tima Sikorski on 04/12/2023.
//

import SwiftUI

struct ContentView: View {
    struct Constants {
        static let defaultAttemptsNumber = 3
    }

    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    let labels = [
        "Estonia": "Flag with three horizontal stripes. Top stripe blue, middle stripe black, bottom stripe white.",
        "France": "Flag with three vertical stripes. Left stripe blue, middle stripe white, right stripe red.",
        "Germany": "Flag with three horizontal stripes. Top stripe black, middle stripe red, bottom stripe gold.",
        "Ireland": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe orange.",
        "Italy": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe red.",
        "Nigeria": "Flag with three vertical stripes. Left stripe green, middle stripe white, right stripe green.",
        "Poland": "Flag with two horizontal stripes. Top stripe white, bottom stripe red.",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red.",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background.",
        "Ukraine": "Flag with two horizontal stripes. Top stripe blue, bottom stripe yellow.",
        "US": "Flag with many red and white stripes, with white stars on a blue background in the top-left corner."
    ]

    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedAnswer: Int?

    @State private var scoreAlertIsPresented = false
    @State private var endOfTheGameAlertIsPresented = false

    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var attemptsNumber = Constants.defaultAttemptsNumber

    var body: some View {
        ZStack {
            // MARK: - Background
            RadialGradient(stops: [
                    .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                    .init(color: .pink, location: 0.3)
                ],
                               center: .top,
                               startRadius: 200,
                               endRadius: 700)
                .ignoresSafeArea()

            VStack {
                Spacer()

                // MARK: - Game Title
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    // MARK: - Game Instruction
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }

                    // MARK: - Flag Buttons
                    ForEach(0..<3) { number in
                        FlagButton(imageName: countries[number], action: {
                            selectedAnswer = number
                        }, animationCompletion: {
                            flagTapped(number)
                        })
                        .unselected(selectedAnswer != nil && selectedAnswer != number)
                        .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                // MARK: - Score
                Text("Score: \(score)")
                    .foregroundStyle(.thickMaterial)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }

        // MARK: -  Attempt results alert
        .alert(scoreTitle, isPresented: $scoreAlertIsPresented) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }

        // MARK: -  End of the game alert
        .alert("Congrats!", isPresented: $endOfTheGameAlertIsPresented) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your score final score is \(score)")
        }
    }
}

// MARK: - Actions
extension ContentView {
    private func flagTapped(_ number: Int) {
        attemptsNumber -= 1

        if number == correctAnswer {
            score += 1
        }

        if attemptsNumber <= 0 {
            showEndOfTheGameAlert()
        } else {
            showAttemptResults(selectedNumber: number)
        }
    }

    private func restartGame() {
        attemptsNumber = Constants.defaultAttemptsNumber
        score = 0
        askQuestion()
    }
}

// MARK: - Other methods
extension ContentView {
    private func showAttemptResults(selectedNumber: Int) {
        scoreMessage = "You have \(attemptsNumber) attempts left"
        if selectedNumber == correctAnswer {
            scoreTitle = "Exactly!"
        } else {
            scoreTitle = "Not quite right :("
            scoreMessage += "\nYou selected the flag of \(countries[selectedNumber])"
        }

        scoreAlertIsPresented = true
    }

    private func showEndOfTheGameAlert() {
        endOfTheGameAlertIsPresented = true
    }

    private func askQuestion() {
        selectedAnswer = nil
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
