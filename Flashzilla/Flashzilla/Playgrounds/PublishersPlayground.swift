//
//  PublishersPlayground.swift
//  Flashzilla
//
//  Created by Tima Sikorski on 24/03/2024.
//

import SwiftUI

struct PublishersPlayground: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0

    var body: some View {
        Text("Hello, World!")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }

                counter += 1
            }
    }
}

#Preview {
    PublishersPlayground()
}
