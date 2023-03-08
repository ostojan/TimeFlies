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
        // TODO: Handle future events
        "Took Place"
    }

    var dateFormatted: String {
        event.wrappedDate.formatted(date: .complete, time: .omitted)
    }

    var timeLead: String {
        "Which is"
    }

    var time: String {
        // TODO: Handle future events
        let components = event.wrappedDate.yearMonthAndDayComponentsTo(Date.now.startOfDay)
        guard let days = components.day,
              let months = components.month,
              let years = components.year
        else {
            fatalError()
        }
        var resultString = ""

        if years > 0 {
            resultString += "\(years) "
            resultString += years == 1 ? "year, " : "years, "
        }

        if months > 0 {
            resultString += "\(months) "
            resultString += months == 1 ? "month, " : "months, "
        }

        resultString += "\(days) "
        resultString += days == 1 ? "day " : "days "
        resultString += "ago"
        return resultString.trimmingCharacters(in: .whitespacesAndNewlines)
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
