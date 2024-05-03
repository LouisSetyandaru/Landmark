//
//  ContentView.swift
//  MacLandmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI

// Tampilan konten utama yang menampilkan daftar landmark.
struct ContentView: View {
    var body: some View {
        LandmarkList()
        // Memuat tampilan daftar landmark dengan ukuran minimum.
            .frame(minWidth: 700, minHeight: 300)
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
