//
//  Habit.swift
//  WhyNotTry
//
//  Created by Dominik Strnadel on 05.02.2025.
//

import SwiftData
import Foundation

@Model
class Habit {
    var id: UUID = UUID()
    var name: String
    var created: Date = Date()

    init(name: String) {
        self.name = name
    }
}
