//
//  PageViewController.swift
//  Landmarks
//
//  Created by Shelfinna on 27/04/24.
//

import SwiftUI
import UIKit


struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPage: Int //untuk mengikuti halaman yang sedang aktif.
    
    //Membuat dan mengembalikan koordinator (Coordinator) untuk mengatur data sumber dan delegasi UIPageViewController.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //Membuat dan mengembalikan instance dari UIPageViewController dengan konfigurasi transisi scroll horizontal.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    //Memperbarui tampilan UIPageViewController dengan halaman yang sesuai berdasarkan nilai currentPage.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    //Mengatur halaman-halaman yang akan ditampilkan dan menangani navigasi halaman.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        // Inisialisasi Coordinator dengan mengambil PageViewController sebagai parameter
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        // Fungsi untuk menampilkan halaman sebelumnya
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
        
        // Fungsi untuk menampilkan halaman setelahnya
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
        
        // Fungsi yang dipanggil ketika animasi navigasi halaman selesai
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
