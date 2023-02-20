//
//  TimeFliesApp.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

@main
struct TimeFliesApp: App {
    @StateObject private var persistenceController = PersistenceController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(persistenceController)
        }
    }
}
