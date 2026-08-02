# CodeBreaker

![Swift](https://img.shields.io/badge/Swift-5.0-orange?logo=swift)
![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-blue?logo=swift)
![SwiftData](https://img.shields.io/badge/Data-SwiftData-purple?logo=apple)
![Platform](https://img.shields.io/badge/Platform-iPhone%20%7C%20iPad-lightgrey?logo=apple)
![Dependencies](https://img.shields.io/badge/Dependencies-None-success)

A native iPhone and iPad code-breaking game built with **SwiftUI** and a **SwiftData model layer**.

CodeBreaker demonstrates modern Apple-platform development through adaptive navigation, reusable view composition, native state management, custom animations, and model-driven game logic.

## Technology

| Technology           | Implementation                                                                  |
| -------------------- | ------------------------------------------------------------------------------- |
| **SwiftUI**          | Declarative UI, forms, toolbars, sheets, lists, transitions, and animations     |
| **SwiftData**        | `@Model`, cascade `@Relationship`, `@Transient`, and app-level `modelContainer` |
| **Adaptive Layout**  | `NavigationSplitView` optimized for both iPhone and iPad                        |
| **State Management** | `@State`, `@Binding`, and `@Bindable` based on data ownership                   |
| **View Composition** | Generic reusable views with `@ViewBuilder` content                              |
| **Native APIs**      | `ColorPicker`, context menus, list editing, navigation, and previews            |

## Engineering Highlights

* **iPhone and iPad support** with an adaptive list-and-detail interface
* **SwiftData models** for games, codes, relationships, and model observation
* **Reusable generic components** shared across the master code, guesses, and attempt history
* **Duplicate-safe matching algorithm** using separate exact and inexact match passes
* **Custom color serialization** between `SwiftUI.Color` and stored hexadecimal values
* **CRUD-style game management** with create, edit, delete, and reorder interactions
* **Coordinated SwiftUI animations** for guesses, restarts, result markers, and code reveals
* **No third-party dependencies**

## Features

* Create named game configurations
* Build custom peg palettes with `ColorPicker`
* Manage multiple games from a sidebar
* Receive exact and inexact match feedback
* Track elapsed game time
* Restart with a newly generated code
* Review previous attempts in reverse chronological order

## Project Structure

```text
CodeBreaker_SwiftUI/
├── Model/                  # SwiftData models and game logic
├── Views/                  # Reusable SwiftUI components
├── GameChooser.swift       # Adaptive split-view navigation
├── GameSummary.swift       # Game-list presentation
└── CodeBreaker_SwiftUIApp.swift
```

## Requirements

* Xcode 26+
* iOS / iPadOS 26+

## Run Locally

```bash
git clone https://github.com/Cevalloa/CodeBreaker_SwiftUI.git
cd CodeBreaker_SwiftUI
open CodeBreaker_SwiftUI.xcodeproj
```

Select an iPhone or iPad simulator and press **Command-R**.

## Author

Built by [Alex Cevallos](https://github.com/Cevalloa).
