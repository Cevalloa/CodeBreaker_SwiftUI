//
//  MatchMarkers.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/19/26.
//

import SwiftUI

struct MatchMarkers: View {
    var body: some View {
        HStack {
            VStack {
                Circle().fill(Color.green)
                Circle().strokeBorder(
                    Color.primary,
                    lineWidth: 3)
                .aspectRatio(1, contentMode: .fit)
            }
            
            VStack {
                Circle()
                Circle().opacity(0)
            }
        }
    }
}

#Preview {
    MatchMarkers()
}
