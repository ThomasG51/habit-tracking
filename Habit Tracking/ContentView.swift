//
//  ContentView.swift
//  Habit Tracking
//
//  Created by Thomas George on 09/09/2021.
//

import SwiftUI

struct activitie {
    let title: String
    let description: String
}

struct ContentView: View {
    @State private var activities: [activitie] = [activitie]()
    @State private var showingAddActivitie: Bool = false
    
    @State private var activitieTitle: String = ""
    @State private var activitieDescription: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Text("List of activities")
            }
            .navigationBarTitle(Text("Activities"))
            .navigationBarItems(trailing:
                Button(
                    action:{
                        self.showingAddActivitie = true
                    },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )
        }
        .sheet(isPresented: $showingAddActivitie) {
            NavigationView {
                Form {
                    Section(header: Text("Title")) {
                        TextField("Title", text: $activitieTitle)
                    }
                    
                    Section(header: Text("Description")) {
                        TextField("Description", text: $activitieDescription)
                    }
                }
                .navigationBarTitle(Text("Add activitie"))
                .navigationBarItems(trailing:
                    Button(
                        action: {},
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
