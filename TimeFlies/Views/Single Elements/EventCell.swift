//
//  EventCell.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

struct EventCell: View {
    let event: Event
    
    var body: some View {
        HStack {
            Text(event.wrappedName)
            Spacer()
            Text(event.wrappedDate.formatted(date: .abbreviated, time: .omitted))
        }
    }
}

struct EventCell_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.preview
        let event = Event(context: persistenceController.viewContext)
        event.name = "Event Cell"
        event.date = Date.now
        return EventCell(event: event)
            .previewLayout(.sizeThatFits)
    }
}
