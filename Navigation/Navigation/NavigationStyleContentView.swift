//
//  NavigationStyleContentView.swift
//  Navigation
//
//  Created by Tima Sikorski on 20/01/2024.
//

import SwiftUI

struct NavigationStyleContentView: View {
    @State private var titleName = "Custom title"

    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle($titleName)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarColorScheme(.dark)
            .toolbar(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .confirmationAction) {
                    Button("Press me") {
                        // do smth
                    }

                    Button("Press me") {
                        // do smth
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    NavigationStyleContentView()
}
