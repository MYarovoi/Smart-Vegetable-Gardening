//
//  MyGardenVegetable.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 02.05.2025.
//

import Foundation
import SwiftData

@Model
class MyGardenVegetable {
    var vegetable: Vegetable
    var plantOption: PlantOption
    var datePlanted: Date = Date()
    
    init(vegetable: Vegetable, plantOption: PlantOption) {
        self.vegetable = vegetable
        self.plantOption = plantOption
    }
}
