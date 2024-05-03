//
//  PageView.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI
// Struct PageView adalah tampilan yang menampilkan halaman-halaman dalam UIPageViewController bersama dengan PageControl.
struct PageView<Page: View>: View {
    var pages: [Page] // Array halaman yang akan ditampilkan.
    @State private var currentPage = 1 // State untuk memantau halaman yang sedang ditampilkan.
    
    
    var body: some View {
        // Tampilan utama PageView, menampilkan PageViewController dan PageControl.
        ZStack(alignment: .bottomTrailing) {
            // PageViewController menampilkan halaman-halaman dari array.
            PageViewController(pages: pages, currentPage: $currentPage)
            // PageControl menampilkan indikator halaman.
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit) // Aspek rasio tampilan PageView.
    }
}


#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
