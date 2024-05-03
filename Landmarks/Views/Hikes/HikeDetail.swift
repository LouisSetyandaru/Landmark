/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing the details for a hike.
*/

import SwiftUI

// Struct HikeDetail menampilkan detail untuk suatu hike.
struct HikeDetail: View {
    let hike: Hike // Hike yang akan ditampilkan.
    @State var dataToShow = \Hike.Observation.elevation // Path data yang ditampilkan secara default.

    // Daftar tombol untuk memilih data yang ditampilkan.
    var buttons = [
        ("Elevation", \Hike.Observation.elevation),
        ("Heart Rate", \Hike.Observation.heartRate),
        ("Pace", \Hike.Observation.pace)
    ]

    var body: some View {
        VStack {
            // Menampilkan grafik untuk hike dengan path data yang dipilih.
            HikeGraph(hike: hike, path: dataToShow)
                .frame(height: 200)

            // Tombol-tombol untuk memilih data yang ditampilkan.
            HStack(spacing: 25) {
                ForEach(buttons, id: \.0) { value in
                    Button {
                        dataToShow = value.1
                    } label: {
                        Text(value.0)
                            .font(.system(size: 15))
                            .foregroundStyle(value.1 == dataToShow
                                ? .gray
                                : .accentColor)
                            .animation(nil)
                    }
                }
            }
        }
    }
}

#Preview {
    HikeDetail(hike: ModelData().hikes[0])
}
