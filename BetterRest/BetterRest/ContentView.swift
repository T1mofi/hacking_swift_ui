//
//  ContentView.swift
//  BetterRest
//
//  Created by Tima Sikorski on 17/12/2023.
//

import SwiftUI

struct ContentView: View {
    @State var number: Double = 0
    @State var wakeup: Date = .now

    var body: some View {
        let dateComponents2 = DateComponents(year: 2023, month: 12, day: 23)

        let dateEnd = Calendar.current.date(from: dateComponents2) ?? .now.addingTimeInterval(1
)

        VStack {
            Stepper("\(number) number", value: $number, in: 8...16, step: 0.5)
            DatePicker("select date", selection: $wakeup, in: Date.now...dateEnd)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
