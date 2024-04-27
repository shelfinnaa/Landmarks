//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Shelfinna on 27/04/24.
//

import SwiftUI

// Struct FeatureCard digunakan untuk menampilkan gambar fitur dari suatu landmark dengan overlay teks.
struct FeatureCard: View {
    var landmark: Landmark
    
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(landmark: landmark)
            }
    }
}

// Struct TextOverlay digunakan untuk menampilkan teks di atas gambar landmark dengan latar belakang gradient.
struct TextOverlay: View {
    var landmark: Landmark
    
    // Gradient linear dari hitam ke transparan untuk overlay teks
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundStyle(.white)
    }
}


#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
