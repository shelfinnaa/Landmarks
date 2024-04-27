//
//  PageControl.swift
//  Landmarks
//
//  Created by Shelfinna on 27/04/24.
//

import SwiftUI
import UIKit


struct PageControl: UIViewRepresentable {
    var numberOfPages: Int // Jumlah halaman yang akan ditampilkan
    @Binding var currentPage: Int // Halaman aktif saat ini
    
    // Fungsi untuk membuat koordinator yang mengatur interaksi dengan UIPageControl
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Fungsi untuk membuat tampilan UIPageControl
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()  // Buat UIPageControl baru
        control.numberOfPages = numberOfPages // Set jumlah halaman
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)), // Panggil fungsi updateCurrentPage ketika nilai berubah
            for: .valueChanged)  // Event saat nilai berubah
        
        return control // Kembalikan UIPageControl yang sudah dibuat
    }
    
    // Fungsi untuk memperbarui tampilan UIPageControl sesuai dengan currentPage
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    // Kelas Coordinator digunakan untuk mengatur interaksi antara PageControl dan UIPageControl
    class Coordinator: NSObject {
        var control: PageControl
        
        // Inisialisasi Coordinator dengan mengambil PageControl sebagai parameter
        init(_ control: PageControl) {
            self.control = control
        }
        
        // Fungsi yang dipanggil saat nilai halaman berubah pada UIPageControl
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
