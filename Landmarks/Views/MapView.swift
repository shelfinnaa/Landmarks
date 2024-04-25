//
//  MapView.swift
//  Landmarks
//
//  Created by Shelfinna on 25/04/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        // Menampilkan peta dengan region yang ditentukan.
        Map(initialPosition: .region(region))
    }
    
    private var region: MKCoordinateRegion {
        // Mengatur region yang akan ditampilkan pada peta.
           MKCoordinateRegion(
               center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
               span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
           )
       }
}

#Preview {
    MapView()
}
