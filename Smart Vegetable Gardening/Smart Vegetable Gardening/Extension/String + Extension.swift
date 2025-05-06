//
//  String + Extension.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 06.05.2025.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
