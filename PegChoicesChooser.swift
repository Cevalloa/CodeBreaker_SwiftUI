//
//  PegChoicesChooser.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/31/26.
//

import SwiftUI

struct PegChoicesChooser: View {
    @Binding var pegChoices: [Peg]
    
    var body: some View {
        List {
            ForEach(pegChoices.indices, id: \.self) { index in
                ColorPicker(
                    selection: $pegChoices[index],
                    supportsOpacity: false
                ) {
                    Button("Peg Choice \(index + 1)", systemImage: "minus.circle") {
                        pegChoices.remove(at: index)
                    }
                }
            }
            
            Button("Add Peg", systemImage: "plus.circle") {
                pegChoices.append(.green)
            }
        }
    }
}

#Preview {
    @Previewable @State var pegChoices: [Peg] = [.green, .orange]
    PegChoicesChooser(pegChoices: $pegChoices)
        .onChange(of: pegChoices) { oldValue, newValue in
            print("pegChoices = \(pegChoices)")
        }
}
