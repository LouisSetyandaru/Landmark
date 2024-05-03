//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by student on 25/04/24.
//

import SwiftUI

// Tampilan untuk menampilkan notifikasi.
struct NotificationView: View {
    var title: String?
    var message: String?
    var landmark: Landmark?


    var body: some View {
        VStack {
            // Menampilkan gambar lingkaran landmark jika tersedia.
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            // Menampilkan judul notifikasi atau "Unknown Landmark" jika tidak ada judul.
            Text(title ?? "Unknown Landmark")
                .font(.headline)
            Divider()
            // Menampilkan pesan notifikasi atau pesan default jika tidak ada pesan.
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

// Preview untuk tampilan NotificationView tanpa argumen.
#Preview {
    NotificationView()
}

// Preview untuk tampilan NotificationView dengan argumen tertentu.
#Preview {
    NotificationView(
        title: "Turtle Rock",
        message: "You are within 5 miles of Turtle Rock.",
        landmark: ModelData().landmarks[0])
}
