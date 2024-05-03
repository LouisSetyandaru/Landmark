//
//  CategoryItem.swift
//  Landmarks
//
//  Created by student on 19/04/24.
//

import SwiftUI

// Struct CategoryItem menampilkan item dalam kategori.
struct CategoryItem: View {
    var landmark: Landmark // Landmark yang akan ditampilkan.


    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(landmark.name)
                .foregroundStyle(.primary)
                .font(.caption)
        }
        .padding(.leading, 15) // Padding untuk konten item.
    }
}


#Preview {
    CategoryItem(landmark: ModelData().landmarks[0])
}
