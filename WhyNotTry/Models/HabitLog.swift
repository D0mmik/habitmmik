//
//  HabitLog.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 06.02.2025.
//

import SwiftData
import Foundation

@Model
class HabitLog {
    var id: UUID = UUID()
    var habitId: UUID
    var date: Date = Date()

    init(habitId: UUID) {
        self.habitId = habitId
    }
}
