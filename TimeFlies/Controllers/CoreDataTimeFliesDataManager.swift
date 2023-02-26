//
//  CoreDataTimeFliesDataManager.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Combine
import Foundation

class CoreDataTimeFliesDataManager: TimeFliesDataManaging {
    private let eventsPublisher = PassthroughSubject<[Event], Never>()
    private let persistenceController: PersistenceController
    private var currentEvents: [Event] = []

    var events: AnyPublisher<[Event], Never> {
        eventsPublisher.eraseToAnyPublisher()
    }

    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }

    func readAllEvents() async throws {
        currentEvents = try persistenceController.viewContext.fetch(Event.fetchRequest())
        sendEvents()
    }

    func delete(event: Event) async throws {
        persistenceController.viewContext.delete(event)
        try persistenceController.save()
        currentEvents.removeAll { $0 == event }
        sendEvents()
    }

    func createEvent(name: String, date: Date) async throws {
        let event = Event(context: persistenceController.viewContext)
        try await update(event: event, name: name, date: date)
    }

    func update(event: Event, name: String, date: Date) async throws {
        event.name = name
        event.date = date.startOfDay

        try persistenceController.save()

        if !currentEvents.contains(event) {
            currentEvents.append(event)
        }

        sendEvents()
    }

    private func sendEvents() {
        eventsPublisher.send(currentEvents)
    }
}
