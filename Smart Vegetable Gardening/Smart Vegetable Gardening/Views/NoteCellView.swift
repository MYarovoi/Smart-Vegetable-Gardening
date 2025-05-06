//
//  NoteCellView.swift
//  Smart Vegetable Gardening
//
//  Created by Никита Яровой on 06.05.2025.
//

import SwiftUI

struct NoteCellView: View {
    let note: Note
    let placeHolderImage: URL?
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(colors: [Color.green.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .frame(width: 85, height: 85)
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
                
                if let photoData = note.photo,
                   let uiImage = UIImage(data: photoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 75, height: 75)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                } else {
                    AsyncImage(url: placeHolderImage) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(note.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(note.body)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
                Text(note.dateCreated, format: .dateTime)
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

