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
    @State private var showingAlert: Bool = false
    
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
                        
                        if tracker.habits.firstIndex(where: { $0.title == habit.title }) == nil {
                            tracker.habits.append(habit)
                        } else {
                            self.showingAlert = true
                        }
                        
                        self.presentationMode.wrappedValue.dismiss()
                    },
                    label: {
                        Text("Save")
                    }
                )
            )
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text("Duplicate Habit Found!"), dismissButton: .cancel())
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(tracker: Tracker())
    }
}
