//
//  HabitModel.swift
//  Habit Tracking
//
//  Created by Thomas George on 10/09/2021.
//

import Foundation

struct Habit: Identifiable {
    let id: UUID = UUID()
    let title: String
    let description: String
    var count: Int = 0
}
