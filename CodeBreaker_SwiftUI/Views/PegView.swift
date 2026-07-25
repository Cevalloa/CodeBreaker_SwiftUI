//
//  PegView.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/25/26.
//

import SwiftUI

struct PegView: View {
    let peg: Peg
    
    let pegShape = Circle()

    var body: some View {
        pegShape
            .contentShape(pegShape)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(peg)    }
}

#Preview {
    PegView(peg: .blue)
}
