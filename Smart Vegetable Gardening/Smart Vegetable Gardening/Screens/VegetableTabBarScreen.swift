//
//  VegetableTabBarScreen.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 02.05.2025.
//

import SwiftUI

struct VegetableTabBarScreen: View {
    var body: some View {
        TabView {
            NavigationStack {
                VegetableListScreen()
            }.tabItem {
                Image(systemName: "leaf")
                Text("Vegetables")
            }
            
            NavigationStack {
                Text("MyGardenScreen")
            }.tabItem {
                Image(systemName: "house")
                Text("My Garden")
            }
            
            NavigationStack {
                Text("PestsScreen")
            }.tabItem {
                Image(systemName: "ladybug")
                Text("Pests")
            }
        }
    }
}

#Preview {
    VegetableTabBarScreen()
}
