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
    
    @Relationship(deleteRule: .cascade) // Once MyGardenVegetable deleted all related notes are deleted too
    var notes: [Note]?
    
    init(vegetable: Vegetable, plantOption: PlantOption) {
        self.vegetable = vegetable
        self.plantOption = plantOption
    }
    
    var daysToHarvest: Int {
        plantOption == .seed ? vegetable.daysToHarvestSeeds : vegetable.daysToHarvestSeedlings
    }
}
