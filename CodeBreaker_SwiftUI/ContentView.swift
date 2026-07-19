//
//  ContentView.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/18/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            pegs(color: [.red, .green, .green, .yellow])
            pegs(color: [.red, .blue, .green, .red])
            pegs(color: [.red, .green, .green, .yellow])
        }.padding()
            .foregroundStyle(.blue)
    }
    
    func pegs(color: Array<Color>) -> some View {
        HStack {
            ForEach(color.indices, id: \.self) { index in
                Circle().foregroundStyle(color[index])
            }
        }
    }
}

#Preview {
    ContentView()
}
