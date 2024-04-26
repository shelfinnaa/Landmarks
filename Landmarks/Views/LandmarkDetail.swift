//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct LandmarkDetail: View {
    var landmark: Landmark
    
    var body: some View {
        ScrollView {
            //so the user can scroll through the descriptive content, and delete the Spacer, which you no longer need.
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                
                
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                
                VStack(alignment: .leading) {
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
    LandmarkDetail(landmark: landmarks[0])
}
