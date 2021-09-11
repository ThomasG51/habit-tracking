//
//  HabitModel.swift
//  Habit Tracking
//
//  Created by Thomas George on 10/09/2021.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID = UUID()
    let title: String
    let description: String
    var count: Int = 0
}
