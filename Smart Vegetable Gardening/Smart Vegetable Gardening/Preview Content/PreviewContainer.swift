//
//  PreviewContainer.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 02.05.2025.
//

import Foundation
import SwiftData

let previewContainer: ModelContainer = {
    let conteiner = try! ModelContainer(for: Vegetable.self, MyGardenVegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    return conteiner
}()
