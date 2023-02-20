//
//  ClearableTextField.swift
//  TimeFlies
//
//  Created by ostojan on 20/02/2023.
//

import SwiftUI

struct ClearableTextField: View {
    private let titleKey: String
    @State private var showClearButton: Bool
    @Binding var text: String

    init(_ titleKey: String, text: Binding<String>) {
        self.titleKey = titleKey
        self._showClearButton = State(wrappedValue: !text.wrappedValue.isEmpty)
        self._text = text
    }

    var body: some View {
        HStack {
            TextField(titleKey, text: $text)
            if showClearButton {
                Label {
                    Text("Clear")
                } icon: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
                .labelStyle(.iconOnly)
                .onTapGesture {
                    text = ""
                }
                .transition(.opacity)
            }
        }
        .onChange(of: text) { currentText in
            withAnimation {
                showClearButton = !currentText.isEmpty
            }
        }
    }
}
