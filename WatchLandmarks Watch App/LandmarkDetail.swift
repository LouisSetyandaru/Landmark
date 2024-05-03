//
//  LandmarkDetail.swift
//  WatchLandmarks Watch App
//
//  Created by student on 25/04/24.
//

import SwiftUI

struct LandmarkDetail: View {
    // Memperoleh data model dari lingkungan.
    @Environment(ModelData.self) var modelData
    // Data landmark yang akan ditampilkan detailnya.
    var landmark: Landmark

    // Mengambil indeks landmark dari model data.
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {
        // Menggunakan bindable untuk mengikat modelData agar berubah saat perubahan terjadi.
        @Bindable var modelData = modelData
        
        // Tampilan utama untuk detail landmark.
        ScrollView {
            VStack {
                // Menampilkan gambar lingkaran landmark.
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
                // Menampilkan nama landmark.
                Text(landmark.name)
                    .font(.headline)
                    .lineLimit(0)
                // Toggle untuk menambahkan atau menghapus landmark dari favorit.
                Toggle(isOn: $modelData.landmarks[landmarkIndex].isFavorite) {
                    Text("Favorite")
                }
                Divider()
                // Menampilkan nama taman landmark.
                Text(landmark.park)
                    .font(.caption)
                    .bold()
                    .lineLimit(0)
                // Menampilkan nama negara bagian landmark.
                Text(landmark.state)
                    .font(.caption)
                Divider()
                // Menampilkan peta dengan lokasi landmark.
                MapView(coordinate: landmark.locationCoordinate)
                    .scaledToFit()
            }
            .padding(16)
        }
        // Menampilkan judul navigasi.
        .navigationTitle("Landmarks")
    }
}


#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
