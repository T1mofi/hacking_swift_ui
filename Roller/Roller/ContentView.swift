//
//  ContentView.swift
//  Roller
//
//  Created by Tima Sikorski on 03/04/2024.
//

import SwiftUI
import SwiftData

@Model
class MainModel {
    var previousRolls: [Int]

    init(previousRolls: [Int]) {
        self.previousRolls = previousRolls
    }
}

struct ContentView: View {
    @Query var mainModel: [MainModel]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            Form() {
                ForEach(mainModel.first?.previousRolls ?? [], id: \.self) { roll in
                    Text("\(roll)")
                }
                Button("Roll") {
                    if mainModel.first == nil {
                        modelContext.insert(MainModel(previousRolls: []))
                    }

                    mainModel.first?.previousRolls.append(.random(in: 1...6))
                }
            }
            .navigationTitle("Roller")
        }
    }
}

#Preview {
    ContentView()
}
