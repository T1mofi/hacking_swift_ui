//
//  CodableDataContentView.swift
//  Moonshot
//
//  Created by Tima Sikorski on 14/01/2024.
//

import SwiftUI

struct MissionsGrid: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()

                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct MissionsList: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    var body: some View {
        List {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    HStack(spacing: 0) {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 64, height: 64)
                            .padding(10)

                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 84)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
            }
            .listRowBackground(Color.darkBackground)
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)

    }
}

struct MainContentView: View {
    private let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    private let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var shouldDisplayAsGrid = true

    var body: some View {
        NavigationStack {
            Group {
                if shouldDisplayAsGrid {
                    MissionsGrid(astronauts: astronauts, missions: missions)
                } else {
                    MissionsList(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationBarItems(
                trailing: Button(action: {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        shouldDisplayAsGrid.toggle()
                    }
                }) {
                    Image(systemName: shouldDisplayAsGrid ? "list.dash" : "square.grid.2x2")
                        .foregroundColor(.white)
                }
            )
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
        }
    }
}

#Preview {
    MainContentView()
}

