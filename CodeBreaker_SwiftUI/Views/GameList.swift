//
//  GameList.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/31/26.
//

import SwiftUI

struct GameList: View {
    // MARK: Data Owned
    @State private var games: [CodeBreaker] = []

    // MARK: - Data shared
    @Binding var selection: CodeBreaker?
    @State private var showGameEditor = false
    @State private var gameToEdit: CodeBreaker?

    var body: some View {
        List(selection: $selection) {
            ForEach(games) {
                game in
                NavigationLink(value: game) {
                    GameSummary(game: game)
                }
                .contextMenu {
                    deleteButton(for: game)
                }
            }
            .onDelete { offsets in
                games.remove(atOffsets: offsets)
            }
            .onMove { offsets, destination in
                games.move(fromOffsets: offsets, toOffset: destination)
            }
        }
        .onChange(of: games) {
            if let selection,
                !games.contains(selection)
            {
                self.selection = nil
            }
        }
        .toolbar {
            addButton
            EditButton()
        }
        .listStyle(.plain)
        .onAppear {
            addSampleGames()
        }
    }
    
    var addButton: some View {
        Button("Add Game", systemImage: "plus") {
            gameToEdit = CodeBreaker(
                name: "Untitled",
                pegChoices: [.red, .blue]
            )
            showGameEditor = true
        }
        .onChange(of: gameToEdit) {
            showGameEditor = gameToEdit != nil
        }
        .sheet(
            isPresented: $showGameEditor,
            onDismiss: {
                if let gameToEdit {
                    games.insert(gameToEdit, at: 0)
                }
            },
            content: {
                gameEditor

            }
        )
    }
    
    @ViewBuilder
    var gameEditor: some View {
        if let gameToEdit {
            NavigationStack {
                GameEditor(game: gameToEdit)
                    .toolbar {

                        ToolbarItem(placement: .cancellationAction)
                        {
                            Button("Cancel") {
                                self.gameToEdit = nil
                            }
                        }

                        ToolbarItem(placement: .confirmationAction)
                        {
                            Button("Done") {
                                games.insert(gameToEdit, at: 0)
                                self.gameToEdit = nil
                            }
                        }
                    }
            }
        }
    }

    func deleteButton(for game: CodeBreaker) -> some View {
        Button(
            "Delete",
            systemImage: "minus.circle",
            role: .destructive
        ) {
            withAnimation {
                games.removeAll(where: { $0 == game })
            }
        }
    }

    func addSampleGames() {
        if games.isEmpty {
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
            selection = games.first
        }
    }
}

#Preview {
    @Previewable @State var selection: CodeBreaker?
    NavigationStack {
        GameList(selection: $selection)
    }
}
