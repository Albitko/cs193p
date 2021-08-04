//
//  Core_Data_FlightsApp.swift
//  Core Data Flights
//
//  Created by Alex on 04.08.2021.
//

import SwiftUI

@main
struct Core_Data_FlightsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
