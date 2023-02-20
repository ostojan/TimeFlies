//
//  TimeFliesDataManaging.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Foundation

protocol TimeFliesDataManaging {
    func readAll() async throws -> [Event]
}
