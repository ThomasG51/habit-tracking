//
//  ContentView.swift
//  Habit Tracking
//
//  Created by Thomas George on 09/09/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var tracker: Tracker = Tracker()
    
    @State private var showingAddHabit: Bool = false
    
    func removeItem(at offsets: IndexSet) {
        tracker.habits.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(self.tracker.habits) { habit in
                    NavigationLink(destination: HabitView(tracker: self.tracker, habit: habit)) {
                        Text(habit.title)
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationBarTitle(Text("Habits Tracker"))
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(
                    action:{
                        self.showingAddHabit = true
                    },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )
        }
        .sheet(isPresented: $showingAddHabit) {
            AddHabitView(tracker: self.tracker)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
