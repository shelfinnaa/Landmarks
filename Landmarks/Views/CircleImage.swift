//
//  CircleImage.swift
//  Landmarks
//
//  Created by Shelfinna on 25/04/24.
//

import SwiftUI

struct CircleImage: View {
// Menampilkan gambar dengan bentuk lingkaran, overlay putih, dan bayangan.
    var body: some View {
        Image("turtlerock")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/) 
            // Menerapkan kliping pada gambar agar berbentuk lingkaran.
            .overlay{
                // Menambahkan overlay lingkaran putih
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
            // Menambahkan bayangan
    }
}

#Preview {
    CircleImage()
}
