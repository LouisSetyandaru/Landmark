//
//  PageControl.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI
import UIKit

// Struct PageControl adalah UIViewRepresentable untuk menampilkan UIPageControl dalam SwiftUI.
struct PageControl: UIViewRepresentable {
    var numberOfPages: Int // Jumlah total halaman.
    @Binding var currentPage: Int // Binding untuk memantau halaman yang sedang ditampilkan.
    
    // Metode ini membuat coordinator untuk PageControl.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Metode ini membuat instance baru dari UIPageControl.
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages // Set jumlah total halaman.
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)// Menambahkan target dan aksi untuk memperbarui halaman saat UIPageControl berubah.
        
        return control
    }
    
    // Metode ini mengupdate tampilan UIPageControl dengan halaman yang sesuai dengan currentPage.
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    // Kelas Coordinator bertindak sebagai delegate untuk UIPageControl.
    class Coordinator: NSObject {
        var control: PageControl
        
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        // Metode ini dipanggil ketika halaman yang ditampilkan dalam UIPageControl berubah.
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
