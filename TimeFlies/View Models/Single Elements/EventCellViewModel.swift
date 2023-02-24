//
//  EventCellViewModel.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Foundation

class EventCellViewModel: ObservableObject {
    private let event: Event

    init(event: Event) {
        self.event = event
    }

    var name: String {
        event.wrappedName
    }

    private var numberOfDays: Int {
        guard let numberOfDays = event.wrappedDate.startOfDay.numDaysTo(Date.now.startOfDay) else {
            fatalError()
        }
        return numberOfDays
    }

    var numberOfDaysFormatted: String {
        abs(numberOfDays).formatted()
    }

    var numberOfDaysCaption: String {
        let numberOfDays = numberOfDays
        let day = abs(numberOfDays) == 1 ? "day" : "days"
        let suffix = numberOfDays >= 0 ? "since" : "to"
        return "\(day) \(suffix)".trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
