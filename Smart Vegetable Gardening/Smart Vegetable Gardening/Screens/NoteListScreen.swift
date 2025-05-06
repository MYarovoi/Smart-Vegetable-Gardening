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
        List(myGardenVegetable.notes ?? []) { note in
            NoteCellView(note: note, placeHolderImage: myGardenVegetable.vegetable.thumbnailImage)
        }
        .navigationTitle(myGardenVegetable.vegetable.name)
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
