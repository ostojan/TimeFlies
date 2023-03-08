//
//  Date+Utils.swift
//  TimeFlies
//
//  Created by ostojan on 21/02/2023.
//

import Foundation

extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }

    func numDaysTo(_ date: Date) -> Int? {
        Calendar.current.dateComponents([.day], from: self, to: date).day
    }

    func yearMonthAndDayComponentsTo(_ date: Date) -> DateComponents {
        Calendar.current.dateComponents([.year, .month, .day], from: self, to: date)
    }
}
