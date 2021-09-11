//
//  HabitVew.swift
//  Habit Tracking
//
//  Created by Thomas George on 09/09/2021.
//

import SwiftUI

struct HabitView: View {
    @ObservedObject var tracker: Tracker
    
    @State var habit: Habit
    
    var body: some View {
        VStack {
            Text(self.habit.title)
                .font(.title)
                .padding(.bottom, 30)
            
            Text(self.habit.description)
                .font(.body)
                .padding(.bottom, 30)
            
            Text("Count: \(self.habit.count)")
                .font(.body)
                .foregroundColor(.red)
            
            Button("push") {
                self.habit.count += 1
                
                if let index = tracker.habits.firstIndex(where: { $0.title == self.habit.title }) {
                    tracker.habits[index] = self.habit
                }
            }
        }
    }
}

struct HabitVew_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(tracker: Tracker(), habit: Habit(title: "OK", description: "Desc"))
    }
}
