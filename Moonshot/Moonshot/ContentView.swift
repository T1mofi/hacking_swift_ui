//
//  ContentView.swift
//  Moonshot
//
//  Created by Tima Sikorski on 14/01/2024.
//

import SwiftUI

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(.lego)
                    .resizable()
                    .scaledToFill()
                    .containerRelativeFrame(.vertical) { size, axis in
                        size * 0.4
                    }
                    .clipped()
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(0..<100) {
                            CustomText("Item \($0)")
                                .font(.title)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
                List(0..<100) { row in
                    NavigationLink("Row \(row)") {
                        Text("Detail \(row)")
                    }
                }
            }
            .padding()
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
