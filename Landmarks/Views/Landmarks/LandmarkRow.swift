//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by student on 18/04/24.
//

import SwiftUI

// Struct LandmarkRow menampilkan baris landmark dalam daftar.
struct LandmarkRow: View {
    var landmark: Landmark // Landmark yang akan ditampilkan.
    
    
    var body: some View {
        HStack {
            landmark.image // Menampilkan gambar landmark.
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
            VStack(alignment: .leading) {
                Text(landmark.name) // Menampilkan gambar landmark.
                    .bold()
                #if !os(watchOS)
                Text(landmark.park) // Menampilkan nama taman landmark dengan format teks kecil dan warna sekunder.
                    .font(.caption)
                    .foregroundStyle(.secondary)
                #endif
            }
            
            Spacer()
            
            if landmark.isFavorite { // Menampilkan bintang jika landmark merupakan favorit.
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 4) // Menambahkan padding vertikal untuk meningkatkan jarak antara baris.
    }
}


#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
