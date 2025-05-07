//
//  SectionView.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 07.05.2025.
//

import SwiftUI

struct SectionView: View {
    let iconName: String
    let title: String
    let content: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(.blue)
                    .font(.title2)
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            
            Text(content)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding(.vertical, 8)
    }
}
