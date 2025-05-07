//
//  VegetableTabBarScreen.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 02.05.2025.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    @State private var vegetables: [Vegetable] = []
    private var pests: [Pest] {
        let allPests = vegetables.flatMap { $0.pests ?? [] }
        return Array(Set(allPests.map { $0.name.lowercased() })) // New array with unic names
            .compactMap { name in
                allPests.first { $0.name.lowercased() == name } // Go thought unic names, compare to allPests.name and create new [Pest] array
            }
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen(vegetables: vegetables)
            }.tabItem {
                Image(systemName: "leaf")
                Text("Vegetables")
            }
            
            NavigationStack {
                MyGardenScreen()
            }.tabItem {
                Image(systemName: "house")
                Text("My Garden")
            }
            
            NavigationStack {
                PestsListScreen(pests: pests)
            }.tabItem {
                Image(systemName: "ladybug")
                Text("Pests")
            }
        }
        .task {
            do {
                let client = VegetableHTTPClient()
                vegetables = try await client.fetchVegetables()
            } catch {
                print("DEBUG: Failed to fetch vegetables: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
        VegetableTabBarScreen()
}
