//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by student on 19/04/24.
//

import SwiftUI


struct FavoriteButton: View {
    @Binding var isSet: Bool // Binding untuk menentukan apakah item favorit atau tidak.


    var body: some View {
        // Tombol yang berisi ikon bintang sesuai dengan status item favorit atau tidak.
        Button {
            isSet.toggle() // Mengubah status item favorit.
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star") // Label berisi ikon bintang yang sesuai dengan status item favorit.
                .labelStyle(.iconOnly) // Menetapkan gaya label ke iconOnly.
                .foregroundStyle(isSet ? .yellow : .gray) // Mengatur warna teks sesuai dengan status item favorit.
        }
    }
}


#Preview {
    FavoriteButton(isSet: .constant(true))
}
