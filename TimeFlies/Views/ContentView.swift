//
//  ContentView.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ContentViewViewModel
    @EnvironmentObject private var dataManagerWrapper: EnvironmentObjectProtocolWrapper<any TimeFliesDataManaging>

    init(dataManager: any TimeFliesDataManaging) {
        self._viewModel = StateObject(wrappedValue: ContentViewViewModel(dataManager: dataManager))
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.events) { event in
                    EventCell(event: event)
                        .contextMenu {
                            Button {
                                viewModel.eventToShowDetails = event
                            } label: {
                                Text("Show Event Info")
                            }
                        }
                }
            }
            .navigationTitle("Time Flies")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        viewModel.showAddEventSheet.toggle()
                    } label: {
                        Label {
                            Text("Add Event")
                        } icon: {
                            Image(systemName: "plus.circle.fill")
                        }
                        .labelStyle(.titleAndIcon)
                    }
                }
            }
            .sheet(item: $viewModel.eventToShowDetails) { event in
                EventInfoView(dataManager: dataManagerWrapper.value, event: event)
            }
            .sheet(isPresented: $viewModel.showAddEventSheet) {
                EventInfoView(dataManager: dataManagerWrapper.value)
            }
        }
        .task {
            await viewModel.loadAllEvents()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.preview
        let dataManager = CoreDataTimeFliesDataManager(persistenceController: persistenceController)

        return ContentView(dataManager: dataManager)
            .environmentObject(EnvironmentObjectProtocolWrapper<any TimeFliesDataManaging>(value: dataManager))
    }
}
