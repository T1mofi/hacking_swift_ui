//
//  ContentView.swift
//  ViwesAndModifiers
//
//  Created by Tima Sikorski on 07/12/2023.
//

import SwiftUI

struct BlurryText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.title)
            .blur(radius: 1)
    }
}

struct ContentView: View {
    @State private var shouldUsePinkColor = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                VStack(spacing: 50) {
                    understandingTypeView
                    conditionModifierView
                }

                Spacer()

                environmentModifiersView
            }
        }
    }

    @ViewBuilder private var understandingTypeView: some View {
        Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
        Text("Hello, world!")
            .frame(maxWidth: 200, maxHeight: 200)
            .background(.cyan)

        Button("check info") {
            print(type(of: self.body))
        }
    }

    @ViewBuilder private var conditionModifierView: some View {
        Button("Change my text color") {
            shouldUsePinkColor.toggle()
        }
        .foregroundStyle(shouldUsePinkColor ? .pink : .blue)
    }

    private var environmentModifiersView: some View {
        VStack {
            ForEach(0..<5) { _ in
                BlurryText(text: "test example")
            }
            .foregroundColor(.yellow)
        }
    }
}

#Preview {
    ContentView()
}
