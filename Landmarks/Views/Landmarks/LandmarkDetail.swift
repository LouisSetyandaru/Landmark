//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by student on 18/04/24.
//

import SwiftUI

// Struct LandmarkDetail menampilkan detail dari suatu landmark.
struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData // Data model yang digunakan.
    var landmark: Landmark // Landmark yang akan ditampilkan.

    // Index dari landmark dalam data model.
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {
        @Bindable var modelData = modelData

        // Tampilan detail landmark dalam ScrollView.
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate) // Menampilkan peta lokasi landmark.
                .frame(height: 300)


            CircleImage(image: landmark.image) // Menampilkan gambar landmark.
                .offset(y: -130)
                .padding(.bottom, -130)


            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }


                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description) // Deskripsi tentang landmark.
            }
            .padding()
        }
        .navigationTitle(landmark.name) // Judul navigasi.
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
