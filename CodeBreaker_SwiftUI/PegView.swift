//
//  PegView.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/25/26.
//

import SwiftUI

struct PegView: View {
    let peg: Peg

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .overlay {
                if peg == Code.missingPeg {
                    RoundedRectangle(cornerRadius: 10)
                        .strokeBorder(Color.gray)
                }
            }
            .contentShape(Rectangle())
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(peg)    }
}

#Preview {
    PegView(peg: .blue)
}
