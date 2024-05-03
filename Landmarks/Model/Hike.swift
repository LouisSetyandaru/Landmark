//
//  Hike.swift
//  Landmarks
//
//  Created by student on 19/04/24.
//

import Foundation

// Definisi struct Hike
struct Hike: Codable, Hashable, Identifiable {
    var id: Int
    var name: String
    var distance: Double
    var difficulty: Int
    var observations: [Observation] // Array dari pengamatan dalam pendakian

    // Properti statis untuk memformat jarak
    static var formatter = LengthFormatter()

    // Computed property untuk mengonversi jarak menjadi teks yang lebih mudah dibaca
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

//Definisi struct Observation
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double
        var elevation: Range<Double>
        var pace: Range<Double>
        var heartRate: Range<Double>
    }
}
