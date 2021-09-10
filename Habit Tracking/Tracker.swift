//
//  Tracker.swift
//  Habit Tracking
//
//  Created by Thomas George on 10/09/2021.
//

import Foundation

class Tracker: ObservableObject {
    @Published var habits: [Habit] = [Habit]()
}
