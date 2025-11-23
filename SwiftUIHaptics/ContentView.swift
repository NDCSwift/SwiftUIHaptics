//
    // Project: SwiftUIHaptics
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    
import SwiftUI

enum Mode: Equatable {
    case success, error, selecting, none
}

struct ContentView: View {
    @State private var mode: Mode = .none
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Success") { mode = .success }
            Button("Error") { mode = .error }
            Button("Select") { mode = .selecting }
        }
        .sensoryFeedback(.success, trigger: mode) { (old: Mode, new: Mode) in
            return new == .success
        }
        .sensoryFeedback(.error, trigger: mode) { (old: Mode, new: Mode) in
            return new == .error
        }
        .sensoryFeedback(.selection, trigger: mode) { (old: Mode, new: Mode) in
            return new == .selecting
        }
    }
}

#Preview {
    ContentView()
}

/*
 Supported SwiftUI haptic (sensory) feedback types:
 
 - .success
 - .warning
 - .error
 - .selection
 
 // Impact feedback with different weights
 - .impact(weight: .light)
 - .impact(weight: .medium)
 - .impact(weight: .heavy)
 - .impact(weight: .soft)
 - .impact(weight: .rigid)
 
 // Value change feedback
 - .increase
 - .decrease
*/
