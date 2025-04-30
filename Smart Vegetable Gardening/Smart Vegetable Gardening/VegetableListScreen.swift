//
//  ContentView.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 30.04.2025.
//

import SwiftUI

struct VegetableListScreen: View {
    @State private var vegetables: [Vegetable] = []
    
    var body: some View {
        List(vegetables) { vegetable in
            Text(vegetable.name)
        }
        .listStyle(.plain)
        .task {
            do {
                let client = VegetableHTTPClient()
                vegetables = try await client.fetchVegetables()
            } catch {
                print("DEBUG: Failed to fetch vegetables: \(error.localizedDescription)")
            }
        }
        .padding()
    }
}

#Preview {
    VegetableListScreen()
}
