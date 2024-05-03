//
//  PageViewController.swift
//  Landmarks
//
//  Created by student on 25/04/24.
//

import SwiftUI
import UIKit

// Struct PageViewController bertindak sebagai UIViewControllerRepresentable untuk mengintegrasikan UIPageViewController ke dalam SwiftUI.
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page] // Array halaman yang akan ditampilkan di UIPageViewController.
    @Binding var currentPage: Int // Binding untuk memantau halaman yang sedang ditampilkan.

    // Metode ini membuat coordinator untuk PageViewController.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Metode ini membuat instance baru dari UIPageViewController.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        
        return pageViewController
    }
    
    // Metode ini mengupdate UIPageViewController dengan halaman yang sesuai dengan currentPage.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    // Kelas Coordinator bertindak sebagai delegate untuk UIPageViewController.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]() // Array untuk menyimpan UIHostingController dari setiap halaman.
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            // Menginisialisasi UIHostingController untuk setiap halaman yang diberikan.
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // Metode ini mengembalikan halaman sebelumnya dalam urutan halaman.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        // Metode ini mengembalikan halaman setelahnya dalam urutan halaman.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        // Metode ini dipanggil setelah transisi selesai dan memperbarui currentPage jika diperlukan.
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
                if completed,
                   let visibleViewController = pageViewController.viewControllers?.first,
                   let index = controllers.firstIndex(of: visibleViewController) {
                    parent.currentPage = index
                }
            }
    }
}
