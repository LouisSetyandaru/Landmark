//
//  CategoryHome.swift
//  Landmarks
//
//  Created by student on 19/04/24.
//

import SwiftUI

// Struct CategoryHome menampilkan tampilan utama aplikasi dengan daftar fitur dan kategori.
struct CategoryHome: View {
    @Environment(ModelData.self) var modelData // EnvironmentObject untuk mengakses data model.
    @State private var showingProfile = false // State untuk menampilkan profil pengguna.
    
    var body: some View {
        NavigationSplitView {
            List {
                //                modelData.features[0].image
                //                    .resizable()
                //                    .scaledToFill()
                //                    .frame(height: 200)
                //                    .clipped()
                //                    .listRowInsets(EdgeInsets())
                
                // Menampilkan PageView dengan fitur-fitur utama sebagai halaman.
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets())
                // Menampilkan setiap kategori dan itemnya sebagai CategoryRow.
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                // Tombol untuk menampilkan profil pengguna.
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            // Menampilkan ProfileHost dalam sheet ketika showingProfile aktif.
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environment(modelData)
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    CategoryHome()
        .environment(ModelData())
}
