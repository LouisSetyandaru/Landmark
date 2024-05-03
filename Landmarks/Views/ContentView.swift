//
//  ContentView.swift
//  Landmarks
//
//  Created by student on 18/04/24.
//

import SwiftUI

// Struct yang mewakili tampilan utama aplikasi
struct ContentView: View {
    //State yang menyimpan tab yang sedang di pilih
    @State private var selection: Tab = .featured
    
    //Enum untuk dua tab yang tersedia: pada 'feature' dan 'list'.
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        //TabView untuk tata letak yang menampilkan berberapa tampilan dalam tab
        TabView(selection: $selection) {
            // Tampilan CategoryHome ditampilkan di tab 'Featured'.
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            // Tampilan LandmarkList ditampilkan di tab 'List'.
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
