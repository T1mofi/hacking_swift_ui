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

struct FancyFormat: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundStyle(LinearGradient(colors: [.indigo, .blue], startPoint: .leading, endPoint: .trailing))
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 6))
    }
}

struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .padding()
                .foregroundStyle(.secondary)
                .font(.caption2)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        return modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    @State private var shouldUsePinkColor = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .cyan], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Image(systemName: "globe")
                    .frame(width: 150, height: 150)
                    .imageScale(.large)
                    .modifier(FancyFormat())
                    .watermarked(with: "Apple's image")

                VStack(spacing: 50) {
                    understandingTypeView
                    conditionModifierView
                }

                Spacer()

                environmentModifiersView
            }
            .padding(60)
        }
    }

    @ViewBuilder private var understandingTypeView: some View {
        Button("check info") {
            print(type(of: self.body))
        }
        .modifier(FancyFormat())
    }

    @ViewBuilder private var conditionModifierView: some View {
        Button("Change my text color") {
            shouldUsePinkColor.toggle()
        }
        .foregroundStyle(shouldUsePinkColor ? .pink : .blue)
    }

    private var environmentModifiersView: some View {
        VStack(alignment: .leading) {
            BlurryText(text: "Environmen Modifier")
            BlurryText(text: "can be applied")
            BlurryText(text: "to many views")
            // Applies to many views

        }
        .foregroundColor(.indigo)
    }
}

#Preview {
    ContentView()
}
