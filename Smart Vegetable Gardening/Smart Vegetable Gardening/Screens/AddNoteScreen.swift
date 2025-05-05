//
//  AddNoteScreen.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 05.05.2025.
//

import SwiftUI

struct AddNoteScreen: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    let myGardenVegetable: MyGardenVegetable
    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""
    
    private func saveNote() {
        let note = Note(title: noteTitle, body: noteBody)
        myGardenVegetable.notes?.append(note)
        try? context.save()
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(height: 200)
        }.toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveNote()
                    dismiss()
                }
            }
        }
    }
}

