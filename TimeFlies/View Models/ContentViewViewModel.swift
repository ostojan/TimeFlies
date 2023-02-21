//
//  ContentViewViewModel.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Combine
import Foundation

class ContentViewViewModel: ObservableObject {
    private let dataManager: any TimeFliesDataManaging
    @Published private(set) var events: [Event] = []
    @Published var showAddEventSheet = false
    private var cancellable: AnyCancellable?

    init(dataManager: any TimeFliesDataManaging) {
        self.dataManager = dataManager
        self.cancellable = dataManager.events.receive(on: DispatchQueue.main)
            .sink { events in
                self.events = events.sorted {
                    if $0.wrappedDate != $1.wrappedDate {
                        return $0.wrappedDate > $1.wrappedDate
                    }
                    return $0.wrappedName < $1.wrappedName
                }
            }
    }

    func loadAllEvents() async {
        do {
            try await dataManager.readAll()
        } catch {
            fatalError("Cannot load events")
        }
    }
}
