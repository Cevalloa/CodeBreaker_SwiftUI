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
    let pegChoices: [Peg] = [.red, .green, .blue, .yellow]
    
    mutating func changeGuessPeg(at index: Int) {
        let existingPeg = guess.pegs[index]
        if let indexOfExisitingPegInPegChoices = pegChoices.firstIndex(of: existingPeg) {
            let newPeg = pegChoices[(indexOfExisitingPegInPegChoices + 1) % pegChoices.count]
            guess.pegs[index] = newPeg
        } else {
            guess.pegs[index] = pegChoices.first ?? Code.missing
        }
    }
}

struct Code {
    var kind: Kind
    var pegs: [Peg] = [.green, .red, .red, .yellow]
    
    static let missing: Peg = .clear
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }
}
