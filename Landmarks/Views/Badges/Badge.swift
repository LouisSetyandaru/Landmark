//
//  Badge.swift
//  Landmarks
//
//  Created by student on 19/04/24.
//

import SwiftUI

// Struct Badge untuk menampilkan badge dengan simbol badge.
struct Badge: View {
    // Variabel computed untuk mendefinisikan simbol badge.
    var badgeSymbols: some View {
        ForEach(0..<8) { index in // Perulangan untuk menampilkan 8 simbol badge yang diputar.
            RotatedBadgeSymbol( // Menggunakan RotatedBadgeSymbol untuk menampilkan simbol badge yang diputar.
                angle: .degrees(Double(index) / Double(8)) * 360.0 // Menghitung sudut rotasi untuk setiap simbol.
            )
        }
        .opacity(0.5) // Menetapkan opacity untuk simbol badge.
    }
    
    var body: some View {
        ZStack { // Menumpuk BadgeBackground dan simbol badge.
            BadgeBackground() // Menampilkan latar belakang badge.
            
            GeometryReader { geometry in // Membaca geometri dari tata letak.
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top) // Menyesuaikan skala simbol badge.
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height) // Menempatkan simbol badge di tengah.
            }
        }
        .scaledToFit() // Menyesuaikan tata letak ke ukuran konten.
    }
}


#Preview {
    Badge()
}
