//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI

// Struct ProfileEditor digunakan untuk mengedit profil pengguna.
struct ProfileEditor: View {
    @Binding var profile: Profile // Binding untuk profil pengguna yang akan diedit.
    
    // Rentang tanggal yang dapat dipilih untuk tanggal target pencapaian.
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            // Field untuk mengubah nama pengguna.
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            // Toggle untuk mengaktifkan atau menonaktifkan notifikasi.
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
            // Picker untuk memilih foto musiman.
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                }
            }
            // DatePicker untuk memilih tanggal target pencapaian.
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
            }
        }
    }
}


#Preview {
    ProfileEditor(profile: .constant(.default))
}
