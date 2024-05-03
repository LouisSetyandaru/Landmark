//
//  ModelData.swift
//  Landmarks
//
//  Created by student on 18/04/24.
//

import Foundation


@Observable
// Kelas ModelData bertanggung jawab untuk menyediakan data aplikasi, seperti landmark dan hiking trails.
class ModelData {
    // Variabel yang menyimpan data landmark yang dimuat dari file JSON.
    var landmarks: [Landmark] = load("landmarkData.json")
    // Variabel yang menyimpan data hiking trails yang dimuat dari file JSON.
    var hikes: [Hike] = load("hikeData.json")
    // Variabel yang menyimpan profil pengguna, defaultnya diambil dari Profile.default.
    var profile = Profile.default
    // Komputasi properti yang mengembalikan landmark yang ditampilkan sebagai fitur.
    var features: [Landmark] {
            landmarks.filter { $0.isFeatured }
        }
    // Komputasi properti yang mengelompokkan landmark berdasarkan kategori.
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

// Fungsi generik untuk memuat data dari file JSON.
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    // Mencari URL file JSON di bundle utama aplikasi.
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // Membaca data dari file JSON.
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // Membuka dan memparsing data JSON menjadi objek T.
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
