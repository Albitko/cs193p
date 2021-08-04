//
//  Persistence.swift
//  Core Data Flights
//
//  Created by Alex on 04.08.2021.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "Core_Data_Flights")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
