//
//  TimeFliesApp.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

@main
struct TimeFliesApp: App {
    @StateObject private var persistenceController: PersistenceController
    @StateObject private var dataManagerWrapper: EnvironmentObjectProtocolWrapper<any TimeFliesDataManaging>

    init() {
        let persistenceController = PersistenceController()
        self._persistenceController = StateObject(wrappedValue: persistenceController)

        let dataManager = EnvironmentObjectProtocolWrapper<any TimeFliesDataManaging>(value: CoreDataTimeFliesDataManager(persistenceController: persistenceController))
        self._dataManagerWrapper = StateObject(wrappedValue: dataManager)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(dataManager: dataManagerWrapper.value)
                .environmentObject(persistenceController)
                .environmentObject(dataManagerWrapper)
        }
    }
}
