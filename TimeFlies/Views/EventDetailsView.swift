//
//  EventDetailsView.swift
//  TimeFlies
//
//  Created by ostojan on 01/03/2023.
//

import SwiftUI

struct EventDetailsView: View {
    @EnvironmentObject private var dataManagerWrapper: EnvironmentObjectProtocolWrapper<any TimeFliesDataManaging>
    @StateObject private var viewModel: EventDetailsViewViewModel

    init(event: Event) {
        self._viewModel = StateObject(wrappedValue: EventDetailsViewViewModel(event: event))
    }

    var body: some View {
        VStack {
            Text(viewModel.name)
                .font(.largeTitle)
            Text(viewModel.dateLead)
                .font(.title2)
            Text(viewModel.dateFormatted)
                .font(.title)
            Text(viewModel.notesLead)
                .font(.caption)
                .bold()
            Text(viewModel.notes)
            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle("Details")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    viewModel.showEditSheet.toggle()
                } label: {
                    Label {
                        Text("Edit")
                    } icon: {
                        Image(systemName: "pencil")
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showEditSheet) {
            EventInfoView(dataManager: dataManagerWrapper.value, event: viewModel.event)
        }
    }
}

struct EventDetails_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.preview
        let dataManager = CoreDataTimeFliesDataManager(persistenceController: persistenceController)
        let event = Event(context: persistenceController.viewContext)
        event.name = "Event Name"
        event.date = Date.now
        try! persistenceController.save()
        return
            NavigationView {
                EventDetailsView(event: event)
            }
            .environmentObject(EnvironmentObjectProtocolWrapper<any TimeFliesDataManaging>(value: dataManager))
    }
}
