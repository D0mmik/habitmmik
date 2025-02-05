//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 20.01.2025.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        HabitsView()
            .modelContainer(for: [Habit.self])
    }
}
#Preview {
    MainView()
}
