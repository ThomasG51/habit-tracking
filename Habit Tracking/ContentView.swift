//
//  ContentView.swift
//  Habit Tracking
//
//  Created by Thomas George on 09/09/2021.
//

import SwiftUI

struct Activity: Identifiable {
    let id: UUID = UUID()
    let title: String
    let description: String
}

struct ContentView: View {
    //@Environment(\.presentationMode) var presentationMode
    
    @State private var activities: [Activity] = [Activity]()
    @State private var showingAddActivity: Bool = false
    
    @State private var activityTitle: String = ""
    @State private var activityDescription: String = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities) { activity in
                    Text(activity.title)
                }
            }
            .navigationBarTitle(Text("Activities"))
            .navigationBarItems(trailing:
                Button(
                    action:{
                        self.showingAddActivity = true
                    },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )
        }
        .sheet(isPresented: $showingAddActivity) {
            NavigationView {
                Form {
                    Section(header: Text("Title")) {
                        TextField("Title", text: $activityTitle)
                    }
                    
                    Section(header: Text("Description")) {
                        TextField("Description", text: $activityDescription)
                    }
                }
                .navigationBarTitle(Text("Add activity"))
                .navigationBarItems(trailing:
                    Button(
                        action: {
                            let activity = Activity(title: self.activityTitle, description: self.activityDescription)
                            self.activities.append(activity)
                            //self.presentationMode.wrappedValue.dismiss()
                            self.showingAddActivity = false
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
