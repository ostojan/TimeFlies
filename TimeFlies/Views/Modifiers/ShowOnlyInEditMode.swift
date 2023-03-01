//
//  ShowOnlyInEditMode.swift
//  TimeFlies
//
//  Created by ostojan on 01/03/2023.
//

import SwiftUI

struct ShowOnlyInEditMode: ViewModifier {
    @Environment(\.editMode) private var editMode

    func body(content: Content) -> some View {
        if editMode?.wrappedValue == .active {
            content
        } else {
            EmptyView()
        }
    }
}

extension View {
    func showOnlyInEditMode() -> some View {
        modifier(ShowOnlyInEditMode())
    }
}

struct ShowOnlyInEditMode_Previews: PreviewProvider {
    static var previews: some View {
        Text("Edit mode is on")
            .showOnlyInEditMode()
            .environment(\.editMode, .constant(.active))
            .previewLayout(.sizeThatFits)
    }
}
