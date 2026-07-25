//
//  CodeBreaker.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/22/26.
//

import SwiftUI

typealias Peg = Color

struct CodeBreaker {
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = []
    let pegChoices: [Peg] //= [.red, .green, .blue, .yellow]
    
    init(pegChoices: [Peg] = [.red, .green, .blue, .yellow]) {
        self.pegChoices = pegChoices
        masterCode.randomize(from: pegChoices)
        print(masterCode)
    }

    mutating func attemptGuess() {
        var attempt = guess
        attempt.kind = .attempt(guess.match(against: masterCode))
        attempts.append(attempt)
    }

    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExisitingPegInPegChoices = pegChoices.firstIndex(
            of: existingPeg
        ) {
            let newPeg = pegChoices[
                (indexOfExisitingPegInPegChoices + 1) % pegChoices.count
            ]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missingPeg
        }
    }
}


