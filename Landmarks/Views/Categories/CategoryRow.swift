//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark] // Daftar landmark dalam kategori tersebut
    
    // Tampilan untuk setiap baris kategori
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            // ScrollView horizontal untuk menampilkan landmark dalam kategori
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: { // Membuat NavigationLink untuk setiap landmark
                            CategoryItem(landmark: landmark)
                            // Menampilkan CategoryItem untuk landmark
                        }
                    }
                }
                
            }
            .frame(height: 185)
        }
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return CategoryRow(
        categoryName: landmarks[0].category.rawValue,
        items: Array(landmarks.prefix(4))
    )
}
