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
    func createEvent(name: String, date: Date) async throws
    func update(event: Event, name: String, date: Date) async throws
}
