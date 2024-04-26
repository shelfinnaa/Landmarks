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
            
            //jika favorit maka ada bintang
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    // Menampilkan dua instance LandmarkRow dengan landmark yang berbeda
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
