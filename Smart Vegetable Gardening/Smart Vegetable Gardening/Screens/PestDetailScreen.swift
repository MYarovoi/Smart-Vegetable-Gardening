//
//  PestDetailScreen.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 07.05.2025.
//

import SwiftUI

struct PestDetailScreen: View {
    let pest: Pest
    
    var body: some View {
        ScrollView {
            AsyncImage(url: pest.photo) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            } placeholder: {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: 250)
            }
            
            SectionView(
                iconName: "info.circle",
                title: "Description",
                content: pest.body
            )
            
            SectionView(
                iconName: "exclamationmark.triangle",
                title: "Symptoms",
                content: pest.symptoms
            )
            
            SectionView(
                iconName: "bandage",
                title: "Treatment",
                content: pest.treatment
            )
        }
        .padding()
        .navigationTitle(pest.name)
        .scrollIndicators(.hidden)
    }
}
