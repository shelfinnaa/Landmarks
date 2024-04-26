//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView { // Menampilkan split view dengan daftar dan detail
            List { // Menampilkan daftar landmark
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                
                // Menampilkan baris kategori untuk setiap kategori
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        } detail: { // Tampilan detail
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
