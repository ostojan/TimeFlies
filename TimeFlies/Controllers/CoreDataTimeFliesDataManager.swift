//
//  CoreDataTimeFliesDataManager.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import Foundation

class CoreDataTimeFliesDataManager: TimeFliesDataManaging {
    private let persistenceController: PersistenceController
    
    init(persistenceController: PersistenceController) {
        self.persistenceController = persistenceController
    }
    
    func readAll() async throws -> [Event] {
        let viewContext = persistenceController.viewContext
        return try viewContext.fetch(Event.fetchRequest())
    }
}
