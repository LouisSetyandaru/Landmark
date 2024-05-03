//
//  LandmarkList.swift
//  Landmarks
//
//  Created by student on 18/04/24.
//

import SwiftUI

// Struct LandmarkList menampilkan daftar landmark.
struct LandmarkList: View {
    @Environment(ModelData.self) var modelData // Data model yang digunakan.
    @State private var showFavoritesOnly = false // State untuk menunjukkan hanya tampilkan favorit atau tidak.
    @State private var filter = FilterCategory.all // State untuk filter kategori landmark.
    @State private var selectedLandmark: Landmark? // State untuk landmark yang dipilih.
    
    // Enum untuk kategori filter.
    enum FilterCategory: String, CaseIterable, Identifiable {
        case all = "All"
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
        
        
        var id: FilterCategory { self }
    }
    
    // Mengembalikan array landmark yang sudah difilter.
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            && (filter == .all || filter.rawValue == landmark.category.rawValue)
        }
    }
    
    // Judul daftar landmark yang ditampilkan.
    var title: String {
        let title = filter == .all ? "Landmarks" : filter.rawValue
        return showFavoritesOnly ? "Favorite \(title)" : title
    }
    
    // Index dari landmark yang dipilih.
    var index: Int? {
        modelData.landmarks.firstIndex(where: { $0.id == selectedLandmark?.id })
    }
    
    // Tampilan utama daftar landmark dengan NavigationSplitView.
    var body: some View {
        @Bindable var modelData = modelData
        
        NavigationSplitView {
            List(selection: $selectedLandmark) {
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                    .tag(landmark)
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem {
                    // Menu untuk filter kategori dan pilihan hanya favorit.
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
        .focusedValue(\.selectedLandmark, $modelData.landmarks[index ?? 0])
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
