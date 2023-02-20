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

    var formattedDate: String {
        event.wrappedDate.formatted(date: .abbreviated, time: .omitted)
    }
}
