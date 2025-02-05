//
//  ContentView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 20.01.2025.
//

import SwiftUI

struct HabitDetailView: View {
    var habitName: String
    
    @State private var currentDate = Date()
    let calendar = Calendar.current
    
    var body: some View {
        VStack {
            Text(habitName)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            MonthTitleView(currentDate: $currentDate)
                .padding()
            CalendarView(currentDate: $currentDate)
            Spacer()
            Button("Log today"){
                
            }.padding()
                .font(.title3)
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
