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
            Button("Restart") {
                withAnimation(.restart) {
                    game.restart()
                    selection = 0
                }
            }

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
                    ).transition(.attempt(game.isOver))
                }
            }

            if !game.isOver {
                PegChooser(
                    choices: game.pegChoices,
                    onChoose: changePegAtSelection
                ).transition(.pegChooser)
            }
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
    static let codeBreaker = Animation.easeInOut(duration: 3)
    static let guess = codeBreaker
    static let restart = codeBreaker
}

extension Color {
    static func gray(_ brightness: CGFloat) -> Color {
        return Color(hue: 148 / 360, saturation: 0, brightness: brightness)
    }
}

extension AnyTransition {
    static let pegChooser = AnyTransition.offset(x: 0, y: 200)
    static func attempt(_ isOver: Bool) -> AnyTransition {
        AnyTransition.asymmetric(
            insertion: isOver ? .opacity : .move(edge: .top),
            removal: .move(edge: .trailing)
        )
    }
}

#Preview {
    CodeBreakerView()
}
