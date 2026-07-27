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
            PegChooser(choices: game.pegChoices, onChoose: nil)
        }
        .onAppear {
            games.append(CodeBreaker(pegChoices: [.red, .blue, .green, .yellow]))
            games.append(CodeBreaker(pegChoices: [.orange, .brown, .black, .yellow]))
            games.append(CodeBreaker(pegChoices: [.blue, .indigo, .cyan]))
        }
    }
}

#Preview {
    GameChooser()
}
