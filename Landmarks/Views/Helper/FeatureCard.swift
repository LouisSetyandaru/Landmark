//
//  FeatureCard.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark


    var body: some View {
        // Menampilkan gambar fitur landmark.
        landmark.featureImage?
            .resizable()
            .overlay {
                // Menambahkan teks overlay di atas gambar.
                TextOverlay(landmark: landmark)
            }
    }
}

// TextOverlay adalah tampilan yang menampilkan teks di atas gambar fitur.
struct TextOverlay: View {
    var landmark: Landmark // Landmark yang akan ditampilkan dalam teks overlay.

    // Gradient untuk latar belakang teks overlay.
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }


    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient // Menampilkan latar belakang gradient.
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}


#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
