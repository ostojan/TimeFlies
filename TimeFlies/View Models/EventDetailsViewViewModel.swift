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

    var dateFormatted: String {
        event.wrappedDate.formatted(date: .complete, time: .omitted)
    }
}
