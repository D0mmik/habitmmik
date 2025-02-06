//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 20.01.2025.
//

import SwiftUI
import SwiftData

struct MainView: View {
    
    var body: some View {
        HabitsView()
            .modelContainer(for: [Habit.self, HabitLog.self])
    }
}
#Preview {
    MainView()
}
