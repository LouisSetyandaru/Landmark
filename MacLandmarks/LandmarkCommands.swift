//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI

// Struktur untuk menentukan perintah yang berlaku untuk landmark.
struct LandmarkCommands: Commands {
    // Binding yang fokus pada landmark yang dipilih.
    @FocusedBinding(\.selectedLandmark) var selectedLandmark


    var body: some Commands {
        // Menambahkan perintah sidebar.
        SidebarCommands()
        // Menu perintah untuk landmark.
        CommandMenu("Landmark") {
            // Tombol untuk menandai atau menghapus landmark sebagai favorit.
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            // Shortcut keyboard untuk menandai landmark sebagai favorit.
            .keyboardShortcut("f", modifiers: [.shift, .option])
            // Menonaktifkan tombol jika tidak ada landmark yang dipilih.
            .disabled(selectedLandmark == nil)
        }
    }
}

// Kunci Binding yang fokus pada landmark yang dipilih.
private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}

// Ekstensi untuk mendapatkan atau mengatur Binding yang fokus pada landmark yang dipilih.
extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
