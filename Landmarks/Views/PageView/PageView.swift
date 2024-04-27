//
//  PageView.swift
//  Landmarks
//
//  Created by Shelfinna on 27/04/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page] //array yang berisi halaman-halaman (views) yang akan ditampilkan dalam PageView.
    @State private var currentPage = 0 //menyimpan nilai indeks halaman saat ini yang sedang ditampilkan dalam PageView.
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            //menampilkan halaman-halaman dari pages dengan menggunakan currentPage sebagai indeks halaman yang sedang aktif.
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
            //menampilkan indikator jumlah halaman dan halaman aktif, dengan menggunakan currentPage sebagai binding untuk mengikuti halaman yang sedang ditampilkan.
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
        .aspectRatio(3 / 2, contentMode: .fit)
    }
}


#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
