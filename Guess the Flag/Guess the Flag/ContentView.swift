//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Tima Sikorski on 04/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)

    @State private var scoreAlertIsPresented = false
    @State private var endOfTheGameAlertIsPresented = false

    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var score = 0
    @State private var attemptsNumber = 8

    var body: some View {
        ZStack {
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
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundStyle(.white)

                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))

                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }

                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.rect(cornerRadius: 8))
                                .shadow(radius: 4)

                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 20))

                Spacer()
                Spacer()

                Text("Score: \(score)")
                    .foregroundStyle(.thickMaterial)
                    .font(.title.bold())

                Spacer()
            }
            .padding()
        }

        // Attempt results alert
        .alert(scoreTitle, isPresented: $scoreAlertIsPresented) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMessage)
        }

        // End of the game alert
        .alert("Congrats!", isPresented: $endOfTheGameAlertIsPresented) {
            Button("Restart", action: restartGame)
        } message: {
            Text("Your score final score is \(score)")
        }
    }

    func flagTapped(_ number: Int) {
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

    func showAttemptResults(selectedNumber: Int) {
        scoreMessage = "You have \(attemptsNumber) attempts left"
        if selectedNumber == correctAnswer {
            scoreTitle = "Exactly!"
        } else {
            scoreTitle = "Not quite right :("
            scoreMessage += "\nYou selected the flag of \(countries[selectedNumber])"
        }

        scoreAlertIsPresented = true
    }

    func showEndOfTheGameAlert() {
        endOfTheGameAlertIsPresented = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func restartGame() {
        attemptsNumber = 8
        score = 0
        askQuestion()
    }
}

#Preview {
    ContentView()
}
