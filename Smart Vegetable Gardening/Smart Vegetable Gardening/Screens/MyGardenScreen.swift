//
//  MyGardenScreen.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 02.05.2025.
//

import SwiftUI
import SwiftData

struct MyGardenScreen: View {
    @Query private var myGardenVegetables: [MyGardenVegetable]
    
    var body: some View {
        List(myGardenVegetables) { myGardenVegeatable in
            NavigationLink {
                NoteListScreen(myGardenVegetable: myGardenVegeatable)
            } label: {
                MyGardenCellView(myGardenVegetable: myGardenVegeatable)
            }
        }
        .listStyle(.plain)
        .navigationTitle("My Garden")
    }
}

#Preview {
    NavigationStack {
        MyGardenScreen()
    }
}
