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
    private let navigationTitle: String
    @Published var name = ""
    @Published var date = Date.now

    init(dataManager: any TimeFliesDataManaging, event: Event?) {
        self.dataManager = dataManager
        self.event = event
        if let event = event {
            self.navigationTitle = "Event Info"
            self.name = event.wrappedName
            self.date = event.wrappedDate
        } else {
            self.navigationTitle = "New Event"
        }
    }
}
