//
//  Tracker.swift
//  Habit Tracking
//
//  Created by Thomas George on 10/09/2021.
//

import Foundation

class Tracker: ObservableObject {
    @Published var habits: [Habit] = [Habit]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
    }
    
    init() {
        if let habits = UserDefaults.standard.data(forKey: "habits") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: habits) {
                self.habits = decoded
                return
            }
        }
        
        self.habits = []
    }
}
