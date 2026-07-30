//
//  GameChooser.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/27/26.
//

import SwiftUI

struct GameChooser: View {

    // MARK: Data Owned
    @State private var games: [CodeBreaker] = []

    var body: some View {
        NavigationStack {
            List{
                ForEach(games) {
                    game in
                    NavigationLink {
                        CodeBreakerView(game: game)
                    } label: {
                        GameSummary(game: game)
                    }
                }
                .onDelete { offsets in
                    games.remove(atOffsets: offsets)
                }
                .onMove { offsets, destination in
                    games.move(fromOffsets: offsets, toOffset: destination)
                }
            }
            .toolbar {
                EditButton()
            }
            .listStyle(.plain)

        }
        .onAppear {
            games.append(
                CodeBreaker(
                    name: "Mastermind",
                    pegChoices: [.red, .blue, .green, .yellow]
                )
            )
            games.append(
                CodeBreaker(
                    name: "Earth Tones",
                    pegChoices: [.orange, .brown, .black, .yellow]
                )
            )
            games.append(
                CodeBreaker(
                    name: "Undersea",
                    pegChoices: [.blue, .indigo, .cyan]
                )
            )
        }
    }
}

#Preview {
    GameChooser()
}
