//
//  HabitVew.swift
//  Habit Tracking
//
//  Created by Thomas George on 09/09/2021.
//

import SwiftUI

struct HabitVew: View {
    let habit: Habit
    
    var body: some View {
        VStack {
            Text(habit.title)
            
            Text(habit.description)
        }
    }
}

struct HabitVew_Previews: PreviewProvider {
    static let habit: Habit = Habit(title: "OK", description: "Desc")
    static var previews: some View {
        HabitVew(habit: habit)
    }
}
