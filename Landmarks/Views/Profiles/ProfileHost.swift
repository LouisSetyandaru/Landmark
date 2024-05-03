//
//  ProfileHost.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI

// Struct ProfileHost bertindak sebagai tampilan utama untuk menampilkan profil pengguna.
struct ProfileHost: View {
    @Environment(\.editMode) var editMode // Environment untuk mengakses mode pengeditan.
    @Environment(ModelData.self) var modelData // EnvironmentObject untuk mengakses data model.
    @State private var draftProfile = Profile.default // State untuk menyimpan draft profil yang diedit.


    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                // Tombol "Cancel" untuk membatalkan pengeditan profil.
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                // Tombol "Edit" untuk memulai atau mengakhiri mode pengeditan.
                EditButton()
            }

            // Menampilkan ProfileSummary jika editMode tidak aktif, atau ProfileEditor jika sedang dalam mode pengeditan.
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}


#Preview {
    ProfileHost()
        .environment(ModelData())
}
