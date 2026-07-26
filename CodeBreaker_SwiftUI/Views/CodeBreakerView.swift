//
//  ContentView.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/18/26.
//

import SwiftUI

struct CodeBreakerView: View {

    // MARK: - Data Owned by class

    @State private var game: CodeBreaker = CodeBreaker(pegChoices: [
        .brown, .yellow, .orange, .black,
    ])
    @State private var selection: Int = 0

    // MARK: - Body

    var body: some View {
        VStack {
            CodeView(
                code: game.masterCode
            )
            ScrollView {
                if !game.isOver {
                    CodeView(
                        code: game.guess,
                        selection: $selection,
                        ancillaryView: { guessButton }
                    )
                }
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    CodeView(
                        code: game.attempts[index],
                        ancillaryView: {
                            MatchMarkers(
                                matches: game.attempts[index].matches ?? []
                            )
                        }
                    )
                }
            }
            PegChooser(choices: game.pegChoices, onChoose: changePegAtSelection)
        }
        .padding()
    }
    
    func changePegAtSelection(to peg: Peg) {
        game.setGuessPeg(peg, at: selection)
        selection = (selection + 1) % game.masterCode.pegs.count
    }

    var guessButton: some View {
        Button("Guess") {
            withAnimation(.guess) {
                game.attemptGuess()
                selection = 0
            }
        }
        .font(.system(size: GuessButton.maximumFontSize))
        .minimumScaleFactor(GuessButton.scaleFactor)
    }

    struct GuessButton {
        static let minimumFontSize: CGFloat = 8
        static let maximumFontSize: CGFloat = 80
        static let scaleFactor: CGFloat = minimumFontSize / maximumFontSize
    }
}

extension Animation {
    static let guess = Animation.easeInOut(duration: 3)
}

extension Color {
    static func gray(_ brightness: CGFloat) -> Color {
        return Color(hue: 148 / 360, saturation: 0, brightness: brightness)
    }
}

#Preview {
    CodeBreakerView()
}
