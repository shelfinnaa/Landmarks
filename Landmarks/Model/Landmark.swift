//
//  Landmark.swift
//  Landmarks
//
//  Created by Shelfinna on 25/04/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable  { //to provide a unique identifier for instances of a type.
// Definisi struct Landmark untuk merepresentasikan landmark.
    
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    private var imageName: String
    // Properti untuk nama file gambar landmark.
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates 
    // Properti untuk koordinat landmark.
    var locationCoordinate: CLLocationCoordinate2D { 
    // Properti komputasi untuk mengonversi koordinat landmark.
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
    // Definisi struct untuk menyimpan koordinat landmark.
        
        var latitude: Double
        var longitude: Double
    }
}



