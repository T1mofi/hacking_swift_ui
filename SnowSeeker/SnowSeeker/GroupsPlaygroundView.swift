//
//  GroupsPlaygroundView.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 07/04/2024.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupsPlaygroundView: View {
    @State private var layoutVertically = false

    var body: some View {
        Button {
            layoutVertically.toggle()
        } label: {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        }
    }}

#Preview {
    GroupsPlaygroundView()
}
