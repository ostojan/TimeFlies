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
        // TODO: Add notes to Event model
        """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien faucibus et molestie ac feugiat sed lectus vestibulum mattis. Varius morbi enim nunc faucibus a pellentesque. Donec ultrices tincidunt arcu non sodales neque sodales. Elementum facilisis leo vel fringilla est ullamcorper eget. Accumsan lacus vel facilisis volutpat est. Pellentesque dignissim enim sit amet venenatis urna cursus eget nunc. Id neque aliquam vestibulum morbi blandit cursus. Imperdiet proin fermentum leo vel orci porta non pulvinar. Commodo elit at imperdiet dui accumsan sit. Sit amet consectetur adipiscing elit duis. Est velit egestas dui id ornare. Lectus quam id leo in vitae turpis massa sed elementum. Maecenas accumsan lacus vel facilisis volutpat est velit egestas dui. Elementum pulvinar etiam non quam lacus suspendisse faucibus. Turpis tincidunt id aliquet risus.
        """
    }
}
