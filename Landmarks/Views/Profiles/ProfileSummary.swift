//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI

// Struct ProfileSummary menampilkan ringkasan dari profil pengguna.
struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData // EnvironmentObject untuk mengakses data model.
    var profile: Profile // Profil pengguna yang akan ditampilkan.
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                // Menampilkan nama pengguna dengan format tebal dan ukuran font besar.
                Text(profile.username)
                    .bold()
                    .font(.title)
                // Menampilkan status notifikasi pengguna.
                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                // Menampilkan preferensi foto musiman pengguna.
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                // Menampilkan tanggal target pencapaian pengguna.
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                // Pembatas antara informasi profil dan badge hiking.
                Divider()
                
                // Menampilkan badge hiking yang telah dicapai pengguna.
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    // ScrollView horizontal untuk badge hiking.
                    ScrollView(.horizontal) {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5)
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                // Pembatas antara badge hiking dan informasi hike terbaru.
                Divider()
                
                // Menampilkan informasi tentang hike terbaru pengguna.
                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    // Menampilkan tampilan hike terbaru.
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}


#Preview {
    ProfileSummary(profile: Profile.default)
        .environment(ModelData())
}
