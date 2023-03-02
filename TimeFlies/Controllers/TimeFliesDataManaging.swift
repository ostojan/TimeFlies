//
//  TimeFliesDataManaging.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Combine
import Foundation

protocol TimeFliesDataManaging {
    var events: AnyPublisher<[Event], Never> { get }

    func readAllEvents() async throws
    func createEvent(name: String, date: Date, notes: String?) async throws
    func update(event: Event, name: String, date: Date, notes: String?) async throws
    func delete(event: Event) async throws
}

extension TimeFliesDataManaging {
    func createEvent(name: String, date: Date) async throws {
        try await createEvent(name: name, date: date, notes: nil)
    }

    func update(event: Event, name: String, date: Date) async throws {
        try await update(event: event, name: name, date: date, notes: nil)
    }
}
