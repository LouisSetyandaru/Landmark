//
//  HikeBadge.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI

// Struct HikeBadge menampilkan badge untuk suatu hike.
struct HikeBadge: View {
    var name: String // Nama badge.


    var body: some View {
        VStack(alignment: .center) {
            Badge() // Menampilkan badge.
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name).")
        }
    }
}


#Preview {
    HikeBadge(name: "Preview Testing")
}
