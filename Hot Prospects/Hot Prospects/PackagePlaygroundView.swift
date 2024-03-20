//
//  PackagePlaygroundView.swift
//  Hot Prospects
//
//  Created by Tima Sikorski on 20/03/2024.
//

import SwiftUI
import SamplePackage

struct PackagePlaygroundView: View {
    let possibleNumbers = 1...60
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.formatted()
    }

    var body: some View {
        Text(results)
    }
}

#Preview {
    PackagePlaygroundView()
}
