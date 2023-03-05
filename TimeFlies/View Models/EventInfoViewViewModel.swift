//
//  EventInfoViewViewModel.swift
//  TimeFlies
//
//  Created by ostojan on 21/02/2023.
//

import Foundation

class EventInfoViewViewModel: ObservableObject {
    private let dataManager: any TimeFliesDataManaging
    private let event: Event?
    let navigationTitle: String
    @Published var name = ""
    @Published var date = Date.now
    @Published var notes = ""
    var canSaveData: Bool {
        !name.isEmpty
    }

    init(dataManager: any TimeFliesDataManaging, event: Event?) {
        self.dataManager = dataManager
        self.event = event
        if let event = event {
            self.navigationTitle = "Event Info"
            self.name = event.wrappedName
            self.date = event.wrappedDate
            self.notes = event.wrappedNotes
        } else {
            self.navigationTitle = "New Event"
        }
    }

    func save() async {
        do {
            if let event = event {
                let _ = try await dataManager.update(event: event, name: name, date: date, notes: notes, color: .black)
            } else {
                let _ = try await dataManager.createEvent(name: name, date: date, notes: notes, color: .black)
            }
        } catch {
            // TODO: Handle error properly
            fatalError()
        }
    }
}
