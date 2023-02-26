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
        NavigationStack {
            ScrollView {
                LazyVStack(alignment: .center) {
                    eventsList
                }
                .padding()
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

    @ViewBuilder var eventsList: some View {
        ForEach(viewModel.events) { event in
            EventCell(event: event)
                .padding()
                .background()
                .roundedBorder(cornerRadius: 16, lineWidth: 2)
                .transition(.opacity.animation(.easeInOut))
                .contextMenu {
                    Button {
                        viewModel.eventToShowDetails = event
                    } label: {
                        Text("Show Event Info")
                    }
                }
        }
        .animation(.default, value: viewModel.events)
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
