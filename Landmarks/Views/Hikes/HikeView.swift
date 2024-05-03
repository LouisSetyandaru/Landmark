/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view displaying information about a hike, including an elevation graph.
*/

import SwiftUI

// Extension untuk menentukan transisi khusus.
extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

// Struct HikeView menampilkan informasi tentang suatu hike, termasuk grafik ketinggian.
struct HikeView: View {
    var hike: Hike // Hike yang akan ditampilkan.
    @State private var showDetail = true // State untuk menampilkan atau menyembunyikan detail hike.


    var body: some View {
        VStack {
            HStack {
                // Menampilkan grafik ketinggian hike.
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)


                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }


                Spacer()

                // Tombol untuk menampilkan atau menyembunyikan detail hike.
                Button {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }

            // Menampilkan detail hike jika showDetail aktif.
            if showDetail {
                HikeDetail(hike: hike)
                    .transition(.moveAndFade)
            }
        }
    }
}
#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
