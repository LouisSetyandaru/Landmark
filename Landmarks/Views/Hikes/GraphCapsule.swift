/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A single line in the graph.
*/

import SwiftUI
// Struct GraphCapsule mewakili satu baris dalam grafik.
struct GraphCapsule: View, Equatable {
    var index: Int // Indeks baris dalam grafik.
    var color: Color
    var height: CGFloat // Tinggi total grafik.
    var range: Range<Double> // Rentang nilai yang direpresentasikan oleh baris.
    var overallRange: Range<Double> // Rentang nilai keseluruhan dalam grafik.

    // Perbandingan tinggi baris terhadap tinggi total grafik.
    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }
    // Perbandingan offset vertikal baris terhadap tinggi total grafik.
    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    var body: some View {
        // Menampilkan Capsule dengan warna, tinggi, dan posisi yang sesuai.
        Capsule()
            .fill(color)
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}

#Preview {
    GraphCapsule(
        index: 0,
        color: .blue,
        height: 150,
        range: 10..<50,
        overallRange: 0..<100)
}
