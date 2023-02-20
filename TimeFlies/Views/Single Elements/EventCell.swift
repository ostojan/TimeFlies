//
//  EventCell.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

struct EventCell: View {
    @StateObject private var viewModel: EventCellViewModel

    init(event: Event) {
        self._viewModel = StateObject(wrappedValue: EventCellViewModel(event: event))
    }

    var body: some View {
        HStack {
            Text(viewModel.name)
            Spacer()
            Text(viewModel.formattedDate)
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
