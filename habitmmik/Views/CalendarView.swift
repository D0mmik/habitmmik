//
//  CalendarView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 27.01.2025.
//

import SwiftUI

struct CalendarView: View {
    
    @Binding var currentDate: Date
    let calendar = Calendar.current
    let logs: [HabitLog]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 8)
    
    private func getDatesForMonth() -> [Int] {
        guard let range = calendar.range(of: .day, in: .month, for: currentDate) else { return [] }
        return Array(range)
    }
    
    private func isLogForDate(_ date: Int) -> Bool {
            let dateToCheck = calendar.date(bySetting: .day, value: date, of: currentDate)!
            return logs.contains { log in
                calendar.isDate(log.date, inSameDayAs: dateToCheck)
            }
        }
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(getDatesForMonth(), id: \.self) { date in
                DayButtonView(text: String(date), isToday: calendar.isDateInToday(calendar.date(bySetting: .day, value: date, of: currentDate)!), isActive: isLogForDate(date))
            }
        }
        .padding()
        HStack {
            Button("Jump to today") {
                currentDate = Date()
            }
            .foregroundColor(.gray)
            .padding(.leading)
            Spacer()
        }
    }
}

#Preview {
    MainView()
}
