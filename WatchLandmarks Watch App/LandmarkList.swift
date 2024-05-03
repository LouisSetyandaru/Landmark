//
//  LandmarkList.swift
//  WatchLandmarks Watch App
//
//  Created by student on 26/04/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false

    // Daftar landmark yang difilter berdasarkan preferensi pengguna.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }


    var body: some View {
        NavigationSplitView {
            // Daftar landmark yang dapat digulirkan.
            List {
                // Tombol toggle untuk menampilkan hanya favorit atau semua landmark.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                // Loop untuk menampilkan setiap landmark dalam daftar.
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            // Tampilan detail yang menampilkan pesan "Select a Landmark".
            Text("Select a Landmark")
        }
    }
}


#Preview {
    LandmarkList()
        .environment(ModelData())
}
