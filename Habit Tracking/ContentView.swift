//
//  ContentView.swift
//  Habit Tracking
//
//  Created by Thomas George on 09/09/2021.
//

import SwiftUI

struct Habit: Identifiable {
    let id: UUID = UUID()
    let title: String
    let description: String
}

struct ContentView: View {
    //@Environment(\.presentationMode) var presentationMode
    
    @State private var habits: [Habit] = [Habit]()
    @State private var showingAddHabit: Bool = false
    
    @State private var habitTitle: String = ""
    @State private var habitDescription: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits) { habit in
                    NavigationLink(destination: HabitVew(habit: habit)) {
                        Text(habit.title)
                    }
                }
            }
            .navigationBarTitle(Text("Habits Tracker"))
            .navigationBarItems(trailing:
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
            NavigationView {
                Form {
                    Section(header: Text("Title")) {
                        TextField("Title", text: $habitTitle)
                    }
                    
                    Section(header: Text("Description")) {
                        TextField("Description", text: $habitDescription)
                    }
                }
                .navigationBarTitle(Text("Add Habit"))
                .navigationBarItems(trailing:
                    Button(
                        action: {
                            let habit = Habit(title: self.habitTitle, description: self.habitDescription)
                            self.habits.append(habit)
                            //self.presentationMode.wrappedValue.dismiss()
                            self.showingAddHabit = false
                        },
                        label: {
                            Text("Save")
                        }
                    )
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
