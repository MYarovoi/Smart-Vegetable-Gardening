//
//  Date + Extension.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 02.05.2025.
//

import Foundation

extension Date {
    func daysAgo(_ days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: self) ?? self
    }
}
