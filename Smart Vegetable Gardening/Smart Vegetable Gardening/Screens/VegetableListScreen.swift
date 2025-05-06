//
//  ContentView.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 30.04.2025.
//

import SwiftUI

struct VegetableListScreen: View {
    let vegetables: [Vegetable]
    
    var body: some View {
        List(vegetables) { vegetable in
            NavigationLink {
                VegetableDetailScreen(vegetable: vegetable)
            } label: {
                VegetableCellView(vegetable: vegetable)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Vegetables")
    }
}
