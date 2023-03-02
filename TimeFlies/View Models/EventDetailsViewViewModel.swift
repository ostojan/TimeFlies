//
//  EventDetailsViewViewModel.swift
//  TimeFlies
//
//  Created by ostojan on 01/03/2023.
//

import Foundation

class EventDetailsViewViewModel: ObservableObject {
    let event: Event
    @Published var showEditSheet = false

    init(event: Event) {
        self.event = event
    }

    var name: String {
        event.wrappedName
    }

    var dateLead: String {
        "Took Place"
    }

    var dateFormatted: String {
        event.wrappedDate.formatted(date: .complete, time: .omitted)
    }

    var notesLead: String {
        if notes.isEmpty {
            return "You haven't written anything about that yet"
        } else {
            return "A few words you wrote about it"
        }
    }

    var notes: String {
        event.wrappedNotes
    }
}
