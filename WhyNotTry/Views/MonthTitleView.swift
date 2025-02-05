//
//  MonthTitleView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 27.01.2025.
//

import SwiftUI

struct MonthTitleView: View {
    
    @Binding var currentDate: Date
    let calendar = Calendar.current
    
    private func nextMonth() {
        withAnimation{
            currentDate = calendar.date(byAdding: .month, value: 1, to: currentDate) ?? Date()
        }
    }
    
    private func previousMonth() {
        withAnimation{
            currentDate = calendar.date(byAdding: .month, value: -1, to: currentDate) ?? Date()
        }
    }
    
    var body: some View {
        HStack {
            Button(action: previousMonth) {
                Image(systemName: "chevron.left")
                    .font(.title)
            }
            Spacer()
            Text("\(currentDate, formatter: DateFormatter.monthAndYear)")
                .font(.title2)
            Spacer()
            Button(action: nextMonth) {
                Image(systemName: "chevron.right")
                    .font(.title)
            }
        }
    }
}

#Preview {
    MainView()
}
