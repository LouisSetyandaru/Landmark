//
//  Landmark.swift
//  Landmarks
//
//  Created by student on 18/04/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    // Properti string yang menyimpan nama gambar landmark.
    private var imageName: String
    // Komputasi properti yang mengembalikan gambar dari landmark.
    var image: Image {
        Image(imageName)
    }
    // Komputasi properti yang mengembalikan gambar fitur dari landmark jika tersedia.
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
    // Properti yang menyimpan koordinat geografis dari landmark.
    private var coordinates: Coordinates
    // Komputasi properti yang mengembalikan koordinat dari landmark dalam tipe CLLocationCoordinate2D.
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    // Struktur Coordinates merepresentasikan koordinat geografis landmark.
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
