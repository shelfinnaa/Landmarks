//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationSplitView {
            // Menampilkan List dari landmarks.
            List(landmarks) { landmark in
                // Setiap landmark dalam List dibungkus dengan NavigationLink untuk navigasi ke detail landmark.
                NavigationLink {
                    LandmarkDetail()
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
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
