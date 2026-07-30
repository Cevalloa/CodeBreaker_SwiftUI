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
    @State private var columnVisibility: NavigationSplitViewVisibility = .all

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            List{
                ForEach(games) {
                    game in
                    NavigationLink(value: game) {
                        GameSummary(game: game)
                    }
                    
                    NavigationLink(value: game.masterCode.pegs) {
                        Text("Cheat")
                    }
//                    NavigationLink {
//                        CodeBreakerView(game: game)
//                    } label: {
//                        GameSummary(game: game)
//                    }
                }
                .onDelete { offsets in
                    games.remove(atOffsets: offsets)
                }
                .onMove { offsets, destination in
                    games.move(fromOffsets: offsets, toOffset: destination)
                }
            }
            .navigationDestination(for: CodeBreaker.self, destination: { game in
                CodeBreakerView(game: game)
            })
            .navigationDestination(for: [Peg].self, destination: { pegs in
                PegChooser(choices:pegs, onChoose: nil)
            })
            .toolbar {
                EditButton()
            }
            .listStyle(.plain)

        } detail: {
            Text("Choose a game!")
        }
        .navigationSplitViewStyle(.balanced)
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
