//
//  PersistenceController.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import CoreData

class PersistenceController: ObservableObject {
    let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TimeFlies")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    func save() throws {
        if viewContext.hasChanges {
            try viewContext.save()
        }
    }
}

extension PersistenceController {
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.viewContext

        let calendar = Calendar.current
        var id = 1
        for num in -2 ... 2 {
            if num == 0 {
                continue
            }
            let event = Event(context: viewContext)
            event.name = "Event \(id)"
            guard let eventDate = calendar.date(byAdding: .day, value: num * 2, to: Date.now) else {
                fatalError()
            }
            event.date = calendar.startOfDay(for: eventDate)
            id += 1
        }

        do {
            try result.save()
        } catch {
            fatalError(error.localizedDescription)
        }

        return result
    }()
}
