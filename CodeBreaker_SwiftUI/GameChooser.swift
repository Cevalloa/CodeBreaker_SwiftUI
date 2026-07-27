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
        List(games, id: \.pegChoices) { game in
            VStack(alignment: .leading) {
                Text(game.name).font(.title)
                PegChooser(choices: game.pegChoices, onChoose: nil)
                    .frame(maxHeight:50)
                Text("^[\(game.attempts.count) attempt](inflect: true)")
            }
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
