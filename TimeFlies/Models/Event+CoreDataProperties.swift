//
//  Event+CoreDataProperties.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//
//

import CoreData
import Foundation

public extension Event {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged var name: String?
    @NSManaged var date: Date?
}

extension Event: Identifiable {}
