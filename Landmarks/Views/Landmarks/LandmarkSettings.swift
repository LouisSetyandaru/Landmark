//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by student on 26/04/24.
//

import SwiftUI

// Struct LandmarkSettings menampilkan pengaturan landmark.
struct LandmarkSettings: View {
    @AppStorage("MapView.zoom") // Menggunakan penyimpanan aplikasi untuk mengatur zoom peta.
    private var zoom: MapView.Zoom = .medium // Nilai zoom peta.
    
    var body: some View {
        Form {
            Picker("Map Zoom:", selection: $zoom) { // Picker untuk memilih level zoom peta.
                ForEach(MapView.Zoom.allCases) { level in // Iterasi melalui semua kasus zoom peta.
                    Text(level.rawValue) // Menampilkan teks untuk setiap level zoom.
                }
            }
            .pickerStyle(.inline) // Mengatur gaya picker menjadi inline.
        }
        .frame(width: 300) // Mengatur lebar frame form.
        .navigationTitle("Landmark Settings") // Judul navigasi.
        .padding(80) // Padding untuk meningkatkan jarak antara konten dan tepi layar.
    }
}

#Preview {
    LandmarkSettings()
}
