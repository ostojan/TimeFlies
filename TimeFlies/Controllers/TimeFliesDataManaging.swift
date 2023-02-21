//
//  TimeFliesDataManaging.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Foundation

protocol TimeFliesDataManaging {
    func readAll() async throws -> [Event]
    func createEvent(name: String, date: Date) async throws -> Event
    func update(event: Event, name: String, date: Date) async throws -> Event
}
