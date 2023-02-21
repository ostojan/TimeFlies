//
//  EventInfoView.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

struct EventInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel: EventInfoViewViewModel
    @FocusState private var nameFieldFocused: Bool

    init(dataManager: any TimeFliesDataManaging, event: Event? = nil) {
        self._viewModel = StateObject(wrappedValue: EventInfoViewViewModel(dataManager: dataManager, event: event))
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    ClearableTextField("Event name", text: $viewModel.name)
                        .focused($nameFieldFocused)
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .bold()
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.ultraThinMaterial)
                        }
                }

                Section {
                    DatePicker("Date", selection: $viewModel.date, displayedComponents: .date)
                        .datePickerStyle(.wheel)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("New Event")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        // TODO: Save or update event
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
            .onAppear {
                nameFieldFocused = true
            }
        }
    }
}

struct EventInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.preview
        let dataManager = CoreDataTimeFliesDataManager(persistenceController: persistenceController)

        return EventInfoView(dataManager: dataManager)
    }
}
