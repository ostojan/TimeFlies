//
//  ContentViewViewModel.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Foundation

class ContentViewViewModel: ObservableObject {
    private let dataManager: any TimeFliesDataManaging
    @Published private(set) var events: [Event] = []
    @Published var showAddEventSheet = false

    init(dataManager: any TimeFliesDataManaging) {
        self.dataManager = dataManager
    }

    func loadAllEvents() async {
        do {
            events = try await dataManager.readAll()
        } catch {
            fatalError("Cannot load events")
        }
    }
}
