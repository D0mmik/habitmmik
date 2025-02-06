//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 20.01.2025.
//

import SwiftUI
import SwiftData

struct HabitDetailView: View {
    var habit: Habit
    
    @Environment(\.modelContext) private var context
    @Query var logs: [HabitLog]
    
    init(habit: Habit) {
        self.habit = habit
        
        let uuid = habit.id
        _logs = Query(filter: #Predicate { log in log.habitId == uuid })
    }
    
    @State private var currentDate = Date()
    let calendar = Calendar.current
    
    var todayLogged: Bool {
        logs.contains(where: { log in
            Calendar.current.isDateInToday(log.date)
        })
    }
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            MonthTitleView(currentDate: $currentDate)
                .padding()
            CalendarView(currentDate: $currentDate, logs: logs)
            Spacer()
            if !todayLogged {
                Button("Log today") {
                    context.insert(HabitLog(habitId: habit.id))
                }
                .padding()
                .font(.title3)
            } else {
                Text("You have already logged today.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

extension DateFormatter {
    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}

#Preview {
    MainView()
}
