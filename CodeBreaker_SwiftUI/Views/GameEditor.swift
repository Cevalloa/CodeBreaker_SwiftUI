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
                PegChoicesChooser(pegChoices: $game.pegColorChoices)
            }
        }
    }
}

#Preview {
    @Previewable let game = CodeBreaker(
        name: "Preview",
        pegChoices: [Color.red, Color.green].map(\.hex))
    GameEditor(game: game)
        .onChange(of: game.name) {
            print("Game name changed to \(game.name)")
        }.onChange(of: game.pegChoices) {
            print("game pegs changed to \(game.pegChoices)")
        }
}
