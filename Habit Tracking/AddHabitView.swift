//
//  AddHabitView.swift
//  Habit Tracking
//
//  Created by Thomas George on 10/09/2021.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var habitTitle: String = ""
    @State private var habitDescription: String = ""
    
    @ObservedObject var tracker: Tracker
    
    var body: some View {
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
                        tracker.habits.append(habit)
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Text("Save")
                    }
                )
            )
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(tracker: Tracker())
    }
}
