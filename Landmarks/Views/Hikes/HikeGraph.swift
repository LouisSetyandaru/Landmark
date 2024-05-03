/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The elevation, heart rate, and pace of a hike plotted on a graph.
*/

import SwiftUI

// Extension untuk menentukan animasi untuk setiap GraphCapsule.
extension Animation {
    static func ripple(index: Int) -> Animation {
            Animation.spring(dampingFraction: 0.5)
                .speed(2)
                .delay(0.03 * Double(index))
    }
}

// Struct HikeGraph menampilkan grafik untuk suatu hike.
struct HikeGraph: View {
    var hike: Hike // Hike yang akan ditampilkan.
    var path: KeyPath<Hike.Observation, Range<Double>> // Path data yang akan ditampilkan.

    // Warna untuk jenis data yang ditampilkan.
    var color: Color {
        switch path {
        case \.elevation:
            return .gray
        case \.heartRate:
            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
        case \.pace:
            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
        default:
            return .black
        }
    }

    var body: some View {
        let data = hike.observations
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] }) // Rentang keseluruhan data.
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()! // Nilai maksimum dalam data.
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange)) // Perbandingan tinggi grafik.

        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    GraphCapsule(
                        index: index,
                        color: color,
                        height: proxy.size.height,
                        range: observation[keyPath: path],
                        overallRange: overallRange
                    )
                    .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

// Fungsi untuk menemukan rentang dari kumpulan rentang.
func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}
// Fungsi untuk menghitung magnitudo dari rentang.
func magnitude(of range: Range<Double>) -> Double {
    range.upperBound - range.lowerBound
}

#Preview {
    let hike = ModelData().hikes[0]
    return Group {
        HikeGraph(hike: hike, path: \.elevation)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.heartRate)
            .frame(height: 200)
        HikeGraph(hike: hike, path: \.pace)
            .frame(height: 200)
    }
}
