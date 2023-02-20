//
//  ContentView.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: ContentViewViewModel

    init(dataManager: any TimeFliesDataManaging) {
        self._viewModel = StateObject(wrappedValue: ContentViewViewModel(dataManager: dataManager))
    }

    var body: some View {
        List {
            ForEach(viewModel.events) {
                Text($0.name ?? "Unknown Name")
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
