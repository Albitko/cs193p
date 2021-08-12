//
//  ContentView.swift
//  Core Data Flights
//
//  Created by Alex on 04.08.2021.
//

// MARK:- Test todo markup

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "location", ascending: true)])
    private var airports: FetchedResults<Airport>

    var body: some View {
        NavigationView{
            List{
                ForEach(airports){ airport in
                    Text(airport.icao ?? "Untitled")
                        
                }
                .onDelete(perform: deleteAirport)
            }
            .navigationTitle("Test Core Data")
            .navigationBarItems(leading: Button("Add"){
                addAirport()
            })
        }
    }
    
    private func addAirport(){
        let newAirport = Airport(context: viewContext)
        newAirport.icao = "Test \(Date())"
        newAirport.location = "123"
        try? viewContext.save()
    }
    
    private func deleteAirport(offsets: IndexSet){
        withAnimation{
            offsets.map{airports[$0]}.forEach(viewContext.delete(_:))
            try? viewContext.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
