//
//  CoreDataTimeFliesDataManager.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Foundation

class CoreDataTimeFliesDataManager: TimeFliesDataManaging {
    private let persistenceController: PersistenceController

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func readAll() async throws -> [Event] {
        let viewContext = persistenceController.viewContext
        let fetchRequest = Event.fetchRequest()
        fetchRequest.sortDescriptors = [
            NSSortDescriptor(key: "date", ascending: false),
            NSSortDescriptor(key: "name", ascending: false),
        ]
        return try viewContext.fetch(fetchRequest)
    }

    func createEvent(name: String, date: Date) async throws -> Event {
        let event = Event(context: persistenceController.viewContext)
        return try await update(event: event, name: name, date: date)
    }

    func update(event: Event, name: String, date: Date) async throws -> Event {
        event.name = name
        event.date = date
        
        try persistenceController.save()
        
        return event
    }
}
