//
//  NewHabitView.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 25.01.2025.
//

import SwiftUI
import CoreData

struct NewHabitView: View {
    
    @Binding var isOpen: Bool
    @State private var habitName: String = ""
    @Environment(\.modelContext) private var context
    
    
    var body: some View {
        Text("New habit")
            .font(.system(size: 20))
            .padding()
        Form {
            TextField("name", text: $habitName)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
        }
        Button("Add new habit") {
            context.insert(Habit(name: habitName))
            isOpen = false
            
        }
        .padding()
        .font(.system(size: 20))
        Spacer()
    }
}

#Preview {
    MainView()
}
