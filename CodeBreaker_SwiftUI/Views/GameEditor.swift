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
            Section("Name") {
                TextField("Name", text: $game.name).onSubmit {
                    print("confirmed edit")
                }
            }

            Section("Pegs") {
                PegChoicesChooser(pegChoices: $game.pegChoices)
            }
        }
    }
}

#Preview {
    @Previewable let game = CodeBreaker(
        name: "Preview",
        pegChoices: [.orange, .purple]
    )
    GameEditor(game: game)
        .onChange(of: game.name) {
            print("Game name changed to \(game.name)")
        }.onChange(of: game.pegChoices) {
            print("game pegs changed to \(game.pegChoices)")
        }
}
