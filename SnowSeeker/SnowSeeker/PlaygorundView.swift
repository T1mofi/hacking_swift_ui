//
//  PlaygorundView.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 05/04/2024.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct PlaygorundView: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false

    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
            isShowingUser = true
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.fraction(0.2), .medium, .large])
        }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) { }
//        }
    }
}

#Preview {
    PlaygorundView()
}
