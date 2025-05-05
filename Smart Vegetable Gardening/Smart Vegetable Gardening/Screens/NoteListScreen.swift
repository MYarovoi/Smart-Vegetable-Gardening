//
//  NoteListScreen.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 05.05.2025.
//

import SwiftUI

struct NoteListScreen: View {
    let myGardenVegetable: MyGardenVegetable
    @State private var addNotePresented: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Note") {
                        addNotePresented = true
                    }
                }
            }.sheet(isPresented: $addNotePresented) {
                NavigationStack {
                    AddNoteScreen(myGardenVegetable: myGardenVegetable)
                }
            }
    }
}
