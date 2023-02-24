//
//  EventCell.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

struct EventCell: View {
    private let viewModel: EventCellViewModel

    init(event: Event) {
        self.viewModel = EventCellViewModel(event: event)
    }

    var body: some View {
        HStack {
            Text(viewModel.name)
                .lineLimit(1)
                .font(.title)
            Spacer()
            VStack {
                Text(viewModel.numberOfDaysFormatted)
                    .font(.headline)
                Text(viewModel.numberOfDaysCaption)
                    .font(.caption)
            }
            .frame(minWidth: 70)
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
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
