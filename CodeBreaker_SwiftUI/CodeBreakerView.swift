//
//  ContentView.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/18/26.
//

import SwiftUI

struct CodeBreakerView: View {
    let game: CodeBreaker = CodeBreaker()
    
    var body: some View {
        VStack {
            pegs(color: [.red, .green, .green, .yellow])
            pegs(color: [.red, .blue, .green, .red])
            pegs(color: [.red, .green, .green, .yellow])
        }.padding()
    }
    
    func pegs(color: Array<Color>) -> some View {
        HStack {
            ForEach(color.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(color[index])
            }
            MatchMarkers(matches: [.exact, .inexact, .nomatch, .exact])
        }
    }
}

#Preview {
    CodeBreakerView()
}
