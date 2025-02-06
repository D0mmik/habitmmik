//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 20.01.2025.
//

import SwiftUI
import SwiftData

@main
struct habitmmik: App {
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: [Habit.self, HabitLog.self])
        }
    }
}
#Preview {
    MainView()
}
