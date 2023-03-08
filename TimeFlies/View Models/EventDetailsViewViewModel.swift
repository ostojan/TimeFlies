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
        if event.alreadyHappened {
            return "Took Place"
        }
        return "Takes Place"
    }

    var dateFormatted: String {
        event.wrappedDate.formatted(date: .complete, time: .omitted)
    }

    var timeLead: String {
        "Which is"
    }

    var time: String {
        let components = event.alreadyHappened
            ? event.wrappedDate.yearMonthAndDayComponentsTo(Date.now.startOfDay)
            : Date.now.startOfDay.yearMonthAndDayComponentsTo(event.wrappedDate)
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
        resultString += event.alreadyHappened ? "ago" : "from now"
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
