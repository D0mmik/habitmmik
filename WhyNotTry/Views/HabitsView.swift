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
    
    @State private var isOpenNewHabit = false
    @State private var isOpenAlert = false
    
    @Query(sort: \Habit.created) var habits: [Habit]
    
    @Environment(\.modelContext) private var context
    
    @State private var habitToDelete: Habit?
    
    var body: some View {
        NavigationStack {
            HStack {
                Text("Your Habits")
                    .font(.system(size: 35))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
            }
            List{
                ForEach(habits, id: \.self) {habit in
                    NavigationLink(habit.name) {
                        HabitDetailView(habit: habit)
                    }.swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button {
                            isOpenAlert = true
                            habitToDelete = habit
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                    }
                }
            }.alert("Are you sure?", isPresented: $isOpenAlert) {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    if let habitToDelete {
                        context.delete(habitToDelete)
                    }
                }
            } message: {
                if let habitToDelete {
                    Text("You are deleting \(habitToDelete.name)")
                }
            }
            HStack {
                Spacer()
                Button("Add new habit") {
                    isOpenNewHabit = true
                }.sheet(isPresented: $isOpenNewHabit, content: {
                    NewHabitView(isOpen: $isOpenNewHabit)
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
