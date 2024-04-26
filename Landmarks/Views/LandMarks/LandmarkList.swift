//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    // Menggunakan @State untuk menyimpan status showFavoritesOnly sebagai state lokal.
    
    var filteredLandmarks: [Landmark] {
        // Menggunakan metode filter pada array landmarks untuk memfilter landmark berdasarkan showFavoritesOnly.
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            // Memeriksa apakah showFavoritesOnly true atau landmark adalah favorit.
        }
    }
    
    var body: some View {
        NavigationSplitView {
            // Menampilkan List dari landmarks.
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    // Setiap landmark dalam List dibungkus dengan NavigationLink untuk navigasi ke detail landmark.
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            // Mengatur judul navigasi.
            .navigationTitle("Landmarks")
        } detail: {
            // Teks yang ditampilkan di panel detail.
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
