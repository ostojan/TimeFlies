//
//  Date+StartOfDay.swift
//  TimeFlies
//
//  Created by ostojan on 21/02/2023.
//

import Foundation

extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}
