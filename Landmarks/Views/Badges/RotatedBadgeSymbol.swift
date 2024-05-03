//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by student on 19/04/24.
//

import SwiftUI

// Struct RotatedBadgeSymbol untuk menampilkan simbol badge yang diputar.
struct RotatedBadgeSymbol: View {
    let angle: Angle
    
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}


#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
