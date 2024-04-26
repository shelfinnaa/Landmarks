//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        // Mengembalikan indeks landmark dalam modelData berdasarkan id landmark.
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        // Membuat binding ke modelData untuk mendapatkan akses ke data aplikasi.
        @Bindable var modelData = modelData
        
        ScrollView {
            //so the user can scroll through the descriptive content, and delete the Spacer, which you no longer need.
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                
                
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        // Menambahkan tombol favorit dengan menggunakan nilai binding dari isFavorite.
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    
                    Text(landmark.name)
                        .font(.title)
                    
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    
                    Divider()
                    
                    
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()
                
                
                Spacer()
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        //to give the navigation bar a title when showing the detail view
    }
}

#Preview {
    let landmarks = ModelData().landmarks
    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}
