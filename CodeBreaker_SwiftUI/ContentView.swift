//
//  ContentView.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/18/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 1, content: greetings)
        .padding()
    }
    
    @ViewBuilder
    func greetings() -> TupleView<(Image, Text, Circle)> {
        Image(systemName: "globe")
        Text("Hello, world!")
        Circle()
    }
}

#Preview {
    ContentView()
}
