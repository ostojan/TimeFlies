//
//  RoundedBorder.swift
//  TimeFlies
//
//  Created by ostojan on 24/02/2023.
//

import SwiftUI

struct RoundedBorder<S: ShapeStyle>: ViewModifier {
    let cornerRadius: CGFloat
    let style: S
    let lineWidth: CGFloat

    func body(content: Content) -> some View {
        content
            .overlay {
                clipShape.strokeBorder(style, lineWidth: lineWidth)
            }
            .clipShape(clipShape)
            .contentShape(.contextMenuPreview, clipShape)
    }

    var clipShape: some InsettableShape {
        RoundedRectangle(cornerRadius: cornerRadius)
    }
}

extension View {
    func roundedBorder<S: ShapeStyle>(cornerRadius: CGFloat, style: S = .foreground, lineWidth: CGFloat = 1.0) -> some View {
        modifier(RoundedBorder(cornerRadius: cornerRadius, style: style, lineWidth: lineWidth))
    }
}

struct RoundedBorder_Preview: PreviewProvider {
    static var previews: some View {
        Text("16 pt corner radius")
            .padding()
            .roundedBorder(cornerRadius: 16)
            .previewLayout(.sizeThatFits)
    }
}
