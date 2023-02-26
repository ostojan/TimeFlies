//
//  EditModeButton.swift
//  TimeFlies
//
//  Created by ostojan on 26/02/2023.
//

import SwiftUI

struct EditModeButton<Label>: View where Label: View {
    @Environment(\.editMode) private var editMode
    private let role: ButtonRole?
    private let action: () -> Void
    private let label: () -> Label

    init(role: ButtonRole? = nil, action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.role = role
        self.action = action
        self.label = label
    }

    var body: some View {
        if editMode?.wrappedValue == .active {
            Button(role: role) {
                action()
            } label: {
                label()
            }
        } else {
            EmptyView()
        }
    }
}

struct EditModeButton_Previews: PreviewProvider {
    static var previews: some View {
        EditModeButton(role: .destructive) {} label: {
            Label("Delete", systemImage: "trash.fill")
        }
        .previewLayout(.sizeThatFits)
        .environment(\.editMode, .init(get: { .active }, set: { _ in }))
    }
}
