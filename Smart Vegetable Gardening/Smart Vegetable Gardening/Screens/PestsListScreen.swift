//
//  PestsListScreen.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 06.05.2025.
//

import SwiftUI

struct PestsListScreen: View {
    let pests: [Pest]
    
    var body: some View {
        List(pests) { pest in
            NavigationLink {
                PestDetailScreen(pest: pest)
            } label: {
                PestCellView(pest: pest)
            }
        }.listStyle(.plain)
            .navigationTitle("Pests")
    }
}
