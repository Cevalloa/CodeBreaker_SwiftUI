//
//  ContentView.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/18/26.
//

import SwiftUI

struct CodeBreakerView: View {
    @State var game: CodeBreaker = CodeBreaker(pegChoices: [
        .brown, .yellow, .orange, .black,
    ])
    var selection: Int = 0

    // MARK: - Body

    var body: some View {
        VStack {
            view(for: game.masterCode)
            ScrollView {
                view(for: game.guess)
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    view(for: game.attempts[index])
                }
            }
            pegChooser
        }
        .padding()
    }

    var pegChooser: some View {
        HStack {
            ForEach(game.pegChoices, id: \.self) { peg in
                Button {
                    game.setGuessPeg(peg, at: selection)
                } label: {
                    PegView(peg: peg)
                }
            }
        }
    }

    var guessButton: some View {
        Button("Guess") {
            withAnimation {
                game.attemptGuess()
            }
        }
        .font(.system(size: 80))
        .minimumScaleFactor(0.1)
    }

    func view(for code: Code) -> some View {
        HStack {
            ForEach(code.pegs.indices, id: \.self) { index in
                PegView(peg: code.pegs[index])
                    .onTapGesture {
                        if code.kind == .guess {
                            game.changeGuessPeg(at: index)
                        }
                    }
            }
            Color.clear.aspectRatio(
                1,
                contentMode: .fit
            )
            .overlay {
                if let matches = code.matches {
                    MatchMarkers(matches: matches)
                } else {
                    if code.kind == .guess {
                        guessButton
                    }
                }
            }
        }
    }
}

#Preview {
    CodeBreakerView()
}
