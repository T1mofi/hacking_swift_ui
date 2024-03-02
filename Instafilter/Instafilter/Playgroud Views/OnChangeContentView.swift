//
//  OnChangeContentView.swift
//  Instafilter
//
//  Created by Tima Sikorski on 02/03/2024.
//

import SwiftUI

struct OnChangeContentView: View {
    @State private var blurAmount = 0.0

    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white

    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0...20)
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("new value is \(newValue)")
                }

            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }

            Button("Hello, World!") {
                showingConfirmation = true
            }
            .frame(width: 300, height: 300)
            .background(backgroundColor)
        }
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
            Button("Green") { backgroundColor = .green }
            Button("Blue") { backgroundColor = .blue }
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")
        }
    }
}

#Preview {
    OnChangeContentView()
}
