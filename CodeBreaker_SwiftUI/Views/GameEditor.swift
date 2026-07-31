//
//  GameEditor.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/31/26.
//

import SwiftUI

struct GameEditor: View {
    @Bindable var game: CodeBreaker
    
    var body: some View {
        Form {
            TextField("Name", text: $game.name)
        }
    }
}

#Preview {
    let game = CodeBreaker(name: "Preview", pegChoices: [.orange, .purple])
    GameEditor(game: game)
        .onChange(of: game.name) {
            print("Game name changed to \(game.name)")
        }.onChange(of: game.pegChoices) {
            print("game pegs changed to \(game.pegChoices)")
        }
}
