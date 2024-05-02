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
                .cornerRadius(5)
            // Mengatur ukuran gambar
            
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .bold()
#if !os(watchOS)
                Text(landmark.park)
                    .font(.caption)
                    .foregroundStyle(.secondary)
#endif
            }
            
            
            Spacer()
            // Spacer untuk mengisi ruang di sebelah kanan
            
            //jika favorit maka ada bintang
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    // Menampilkan dua instance LandmarkRow dengan landmark yang berbeda
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
