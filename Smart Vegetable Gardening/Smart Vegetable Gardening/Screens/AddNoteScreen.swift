//
//  AddNoteScreen.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 05.05.2025.
//

import SwiftUI
import PhotosUI

struct AddNoteScreen: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    let myGardenVegetable: MyGardenVegetable
    @State private var noteTitle: String = ""
    @State private var noteBody: String = ""
    @State private var selectedPhotoItem: PhotosPickerItem? = nil
    @State private var uiImage: UIImage?
    @State private var imageData: Data?
    @State private var isCameraSelected: Bool = false
    private var isFormValid: Bool {
        !noteTitle.isEmptyOrWhitespace || !noteBody.isEmptyOrWhitespace
    }
    
    private func saveNote() {
        let note = Note(title: noteTitle, body: noteBody)
        note.photo = imageData
        myGardenVegetable.notes?.append(note)
        try? context.save()
    }
    
    var body: some View {
        Form {
            TextField("Title", text: $noteTitle)
            TextEditor(text: $noteBody)
                .frame(height: 200)
            
            HStack(spacing: 20) {
                Button {
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        isCameraSelected = true
                    }
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 60, height: 60)
                        Image(systemName: "camera.fill")
                            .font(.title)
                            .foregroundStyle(.green)
                    }
                }

                
                PhotosPicker(selection: $selectedPhotoItem, matching: .images, photoLibrary: .shared()) {
                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.2))
                            .frame(width: 60, height: 60)
                        Image(systemName: "photo.on.rectangle")
                            .font(.title)
                            .foregroundStyle(.blue)
                            
                    }
                }
            }.buttonStyle(.borderless)
            
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .frame(maxWidth: 300, maxHeight: 300)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    .padding()
            }
            
        }.navigationTitle("Add Note")
        
        .task(id: selectedPhotoItem) { // any time selectedPhotoItem is changed will run this task
            if let selectedPhotoItem {
                do {
                    if let data = try await selectedPhotoItem.loadTransferable(type: Data.self) {
                        uiImage = UIImage(data: data)
                        imageData = data
                    }
                } catch {
                    print("DEBUG: Failed to load image data: \(error.localizedDescription)")
                }
            }
        }
        
        .sheet(isPresented: $isCameraSelected, content: {
            ImagePicker(image: $uiImage, sourceType: .camera)
        })
        
        .onChange(of: uiImage, { _, _ in
            imageData = uiImage?.pngData()
        })
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    saveNote()
                    dismiss()
                }.disabled(!isFormValid)
            }
        }
    }
}

