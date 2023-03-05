//
//  Event+CoreDataProperties.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//
//

import CoreData
import Foundation
import SwiftUI

public extension Event {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged var name: String?
    @NSManaged var date: Date?
    @NSManaged var notes: String?
    // TODO: Use better way to store Event color
    @NSManaged private var red: Double
    @NSManaged private var green: Double
    @NSManaged private var blue: Double

    var wrappedName: String {
        name ?? "Unknown Name"
    }

    var wrappedDate: Date {
        date ?? Date.now
    }

    var wrappedNotes: String {
        notes ?? ""
    }

    var color: Color {
        get {
            Color(red: red, green: green, blue: blue)
        }
        set {
            let components = newValue.components()
            red = components.red
            green = components.green
            blue = components.blue
        }
    }
}

extension Event: Identifiable {}
