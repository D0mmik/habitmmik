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
    var id: UUID
    var name: String

    init(id: UUID? = nil, name: String) {
        self.id = id ?? UUID()
        self.name = name
    }
}
