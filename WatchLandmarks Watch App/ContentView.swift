//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by student on 25/04/24.
//

import SwiftUI
import UserNotifications

// ContentView adalah tampilan utama aplikasi.
struct ContentView: View {
    var body: some View {
        // Menampilkan daftar landmark pada tampilan utama.
        LandmarkList()
        // Menggunakan task untuk meminta izin notifikasi ketika tampilan dimuat.
            .task {
                let center = UNUserNotificationCenter.current()
                // Meminta izin untuk menampilkan notifikasi dengan alert, sound, dan badge.
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
