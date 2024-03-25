//
//  ScenePhasePlayground.swift
//  Flashzilla
//
//  Created by Tima Sikorski on 24/03/2024.
//

import SwiftUI

struct ScenePhasePlayground: View {
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Text("Hello, world!")
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    ScenePhasePlayground()
}
