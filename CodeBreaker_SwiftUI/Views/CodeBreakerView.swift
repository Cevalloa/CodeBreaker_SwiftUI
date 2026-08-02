//
//  ContentView.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/18/26.
//

import SwiftUI

struct CodeBreakerView: View {

    let game: CodeBreaker

    // MARK: - Data Owned by class

    @State private var selection: Int = 0
    @State private var restarting = false
    @State private var hideMostRecentMarkers = false

    // MARK: - Body

    var body: some View {
        VStack {
            CodeView(code: game.masterCode)
            ScrollView {
                if !game.isOver || restarting {
                    CodeView(
                        code: game.guess,
                        selection: $selection,
                        ancillaryView: { guessButton }
                    )
                    .animation(nil, value: game.attempts.count)
                    .opacity(restarting ? 0 : 1)
                }
                ForEach(game.attempts.indices.reversed(), id: \.self) { index in
                    CodeView(
                        code: game.attempts[index],
                        ancillaryView: {

                            let showMarkers =
                                !hideMostRecentMarkers
                                || index != game.attempts.count - 1

                            if showMarkers,
                                let matches = game.attempts[index].matches
                            {
                                MatchMarkers(
                                    matches: game.attempts[index].matches ?? []
                                )
                            }
                        }
                    ).transition(.attempt(game.isOver))
                }
            }

            if !game.isOver {
                PegChooser(
                    choices: game.pegChoices,
                    onChoose: changePegAtSelection
                ).transition(.pegChooser).frame(maxHeight: 90)
            }
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Restart", systemImage: "arrow.circlepath") {
                    withAnimation(.restart) {
                        restarting = true
                    } completion: {
                        withAnimation(.restart) {
                            game.restart()
                            selection = 0
                            restarting = false
                        }
                    }
                }
            }

            ToolbarItem(placement: .automatic) {
                ElapsedTime(startTime: game.startTime, endTime: game.endTime)
                    .flexibleSystemFont()
                    .monospaced()
                    .lineLimit(1)
            }
        }
    }

    func changePegAtSelection(to peg: Peg) {
        game.setGuessPeg(peg, at: selection)
        selection = (selection + 1) % game.masterCode.pegs.count
    }

    var guessButton: some View {
        Button("Guess") {
            guess()
        }.flexibleSystemFont()
    }

    func guess() {
        withAnimation(.guess) {
            game.attemptGuess()
            selection = 0
            hideMostRecentMarkers = true
        } completion: {
            withAnimation(.guess) {
                hideMostRecentMarkers = false
            }
        }
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

extension View {
    func flexibleSystemFont(minimum: CGFloat = 8, maximum: CGFloat = 80)
        -> some View
    {
        self.font(.system(size: maximum))
            .minimumScaleFactor(minimum / maximum)
    }
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

extension CodeBreaker {
    convenience init(name: String = "Code breaker", pegChoices:[Color]) {
        self.init(name: name, pegChoices: pegChoices.map(\.hex))
    }
    
    var pegColorChoices: [Color] {
        get { pegChoices.map {Color(hex: $0) ?? .clear}}
        set { pegChoices = newValue.map(\.hex)}
    }
}

#Preview {
    @Previewable @State var game = CodeBreaker(
        name: "Preview",
        pegChoices: [.blue, .red, .orange]
    )
    NavigationStack {
        CodeBreakerView(game: game)
    }
}
