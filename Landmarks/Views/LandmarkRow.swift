//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark 
    // landmark yang akan ditampilkan dalam baris ini
    var body: some View {
        HStack {
            landmark.image 
            // Menampilkan gambar landmark
                .resizable()
                .frame(width: 50, height: 50) 
            // Mengatur ukuran gambar
            
            Text(landmark.name) 
            // Menampilkan nama landmark
            
            Spacer() 
            // Spacer untuk mengisi ruang di sebelah kanan
        }
    }
}

// Preview untuk LandmarkRow
#Preview {
    LandmarkRow(landmark: landmarks[0]) 
    // Menampilkan preview dari LandmarkRow dengan landmark pertama dari array landmarks
}
