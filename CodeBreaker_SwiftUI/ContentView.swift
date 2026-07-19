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
            Image(systemName: "globe")
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundStyle(.orange)
                .background(.yellow)
                .padding()
            Circle()
        }.padding()
            .foregroundStyle(.blue)
    }
}

#Preview {
    ContentView()
}
