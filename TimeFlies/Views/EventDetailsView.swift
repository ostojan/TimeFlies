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
        event.notes =
            """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sapien faucibus et molestie ac feugiat sed lectus vestibulum mattis. Varius morbi enim nunc faucibus a pellentesque. Donec ultrices tincidunt arcu non sodales neque sodales. Elementum facilisis leo vel fringilla est ullamcorper eget. Accumsan lacus vel facilisis volutpat est. Pellentesque dignissim enim sit amet venenatis urna cursus eget nunc. Id neque aliquam vestibulum morbi blandit cursus. Imperdiet proin fermentum leo vel orci porta non pulvinar. Commodo elit at imperdiet dui accumsan sit. Sit amet consectetur adipiscing elit duis. Est velit egestas dui id ornare. Lectus quam id leo in vitae turpis massa sed elementum. Maecenas accumsan lacus vel facilisis volutpat est velit egestas dui. Elementum pulvinar etiam non quam lacus suspendisse faucibus. Turpis tincidunt id aliquet risus.
            """
        try! persistenceController.save()
        return
            NavigationView {
                EventDetailsView(event: event)
            }
            .environmentObject(EnvironmentObjectProtocolWrapper<any TimeFliesDataManaging>(value: dataManager))
    }
}
