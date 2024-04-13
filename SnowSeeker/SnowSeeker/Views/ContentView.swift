//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tima Sikorski on 08/04/2024.
//

import SwiftUI

private enum SortMethod: String, CaseIterable, Identifiable {
    case `default`
    case name
    case country

    var id: String {
        self.rawValue
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchText = ""
    @State private var favorites = Favorites()
    @State private var sortOredr: SortMethod = .default

    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            sortedResorts
        } else {
            sortedResorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }

    var sortedResorts: [Resort] {
        switch sortOredr {
        case .default:
            return resorts
        case .name:
            return resorts.sorted { lhs, rhs in
                lhs.name < rhs.name
            }
        case .country:
            return resorts.sorted { lhs, rhs in
                lhs.country < rhs.country
            }
        }
    }

    var body: some View {
        NavigationSplitView {
            List(filteredResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .font(.title2)
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOredr) {
                        ForEach(SortMethod.allCases) { sortMethod in
                            Text(sortMethod.rawValue)
                                .tag(sortMethod)
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
