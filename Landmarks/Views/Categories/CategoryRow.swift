//
//  CategoryRow.swift
//  Landmarks
//
//  Created by student on 19/04/24.
//

import SwiftUI

// Struct CategoryRow menampilkan baris kategori dengan item-itemnya.
struct CategoryRow: View {
    var categoryName: String // Nama kategori.
    var items: [Landmark] // Item-item dalam kategori tersebut.
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            // ScrollView horizontal untuk menampilkan item-item kategori.
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    // Loop melalui setiap landmark dalam kategori untuk membuat CategoryItem.
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185) // Menetapkan tinggi untuk ScrollView.
        }
    }
}


#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}
