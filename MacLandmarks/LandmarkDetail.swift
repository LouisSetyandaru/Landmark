//
//  LandmarkDetail.swift
//  MacLandmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI
import MapKit


struct LandmarkDetail: View {
    // Lingkungan model data untuk mengakses data landmark.
    @Environment(ModelData.self) var modelData
    // Data landmark yang ditampilkan.
    var landmark: Landmark
    // Indeks landmark dalam data model.
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }


    var body: some View {
        // Mengikat model data untuk penggunaan dalam tampilan.
        @Bindable var modelData = modelData
        
        ScrollView {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                // Tampilan peta landmark.
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)

                // Tombol untuk membuka peta dalam aplikasi Peta.
                Button("Open in Maps") {
                    let destination = MKMapItem(placemark: MKPlacemark(coordinate: landmark.locationCoordinate))
                    destination.name = landmark.name
                    destination.openInMaps()
                }
                .padding()
            }


            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 24) {
                    CircleImage(image: landmark.image.resizable())
                        .frame(width: 160, height: 160)


                    VStack(alignment: .leading) {
                        HStack {
                            Text(landmark.name)
                                .font(.title)
                            // Tombol untuk menandai landmark sebagai favorit.
                            FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                                .buttonStyle(.plain)
                        }


                        VStack(alignment: .leading) {
                            Text(landmark.park)
                            Text(landmark.state)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    }
                }


                Divider()


                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            .frame(maxWidth: 700)
            .offset(y: -50)
        }
        .navigationTitle(landmark.name)
    }
}


#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
        .frame(width: 850, height: 700)
}
