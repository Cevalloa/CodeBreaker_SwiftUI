//
//  CodeBreaker_SwiftUIApp.swift
//  CodeBreaker_SwiftUI
//
//  Created by Alex Cevallos on 7/18/26.
//

import SwiftData
import SwiftUI

@main
struct CodeBreaker_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            GameChooser().modelContainer(for: CodeBreaker.self)
        }
    }
}
