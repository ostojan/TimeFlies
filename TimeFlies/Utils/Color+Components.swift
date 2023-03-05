//
//  Color+Components.swift
//  TimeFlies
//
//  Created by ostojan on 05/03/2023.
//

import Foundation
import SwiftUI

extension Color {
    func components() -> (red: Double, green: Double, blue: Double, alpha: Double) {
        let cgColor = UIColor(self).cgColor
        guard let components = cgColor.components, cgColor.numberOfComponents == 4 else {
            // TODO: Handle error properly
            fatalError()
        }
        return (components[0], components[1], components[2], components[3])
    }

    init(red: Double, green: Double, blue: Double, alpha: Double = 1.0) {
        self.init(cgColor: CGColor(red: red, green: green, blue: blue, alpha: alpha))
    }
}
