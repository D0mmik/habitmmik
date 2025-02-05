//
//  HabitsView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 25.01.2025.
//

import SwiftUI
import CoreData
import _SwiftData_SwiftUI

struct HabitsView: View {
    
    @State private var isOpen = false
    
    @Query var habits: [Habit]
    
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Your Habits \(habits.count)")
                    .font(.system(size: 35))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding()
            }
            List{
                ForEach(habits, id: \.self) {habit in
                    NavigationLink(String(habit.name ?? "unknown")) {
                        HabitDetailView(habitName: "habit name \(habit.name)")
                    }.swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button(role: .destructive) {
                            
                            context.delete(habit)
                            
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            HStack {
                Spacer()
                Button("Add new habit") {
                    isOpen = true
                }.sheet(isPresented: $isOpen, content: {
                    NewHabitView(isOpen: $isOpen)
                        .presentationDetents([.medium])
                })
                
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
                .padding(.bottom, 30)
                Spacer()
            }
            
        }
    }
}

#Preview {
    MainView()
}
