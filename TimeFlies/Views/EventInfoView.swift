//
//  EventInfoView.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

struct EventInfoView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var name = ""
    @State private var date = Date.now
    @FocusState private var nameFieldFocused: Bool

    var body: some View {
        NavigationView {
            Form {
                Section {
                    ClearableTextField("Event name", text: $name)
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
                    DatePicker("Date", selection: $date, displayedComponents: .date)
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
        EventInfoView()
    }
}
