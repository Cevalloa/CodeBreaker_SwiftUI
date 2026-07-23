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
    
    
}

struct Code {
    var kind: Kind
    var pegs: [Peg] = [.green, .red, .red, .yellow]
    
    enum Kind {
        case master
        case guess
        case attempt
        case unknown
    }
}
