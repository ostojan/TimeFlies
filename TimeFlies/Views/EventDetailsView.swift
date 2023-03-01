//
//  EventDetailsView.swift
//  TimeFlies
//
//  Created by ostojan on 01/03/2023.
//

import SwiftUI

struct EventDetailsView: View {
    private var viewModel: EventDetailsViewViewModel

    init(event: Event) {
        self.viewModel = EventDetailsViewViewModel(event: event)
    }

    var body: some View {
        VStack {
            Text(viewModel.dateFormatted)
                .font(.title)
        }
        .navigationTitle(viewModel.name)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {} label: {
                    Label {
                        Text("Edit")
                    } icon: {
                        Image(systemName: "pencil")
                    }
                }
            }
        }
    }
}

struct EventDetails_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.preview
        let event = Event(context: persistenceController.viewContext)
        event.name = "Event Name"
        event.date = Date.now
        return NavigationView {
            EventDetailsView(event: event)
        }
    }
}
