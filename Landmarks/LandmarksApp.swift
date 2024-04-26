//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Shelfinna on 25/04/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData() // Membuat instance ModelData sebagai state lokal.
    
    var body: some Scene {
        WindowGroup {
            // Menampilkan ContentView dan meneruskan ModelData sebagai environment object.
            ContentView()
                .environment(modelData)
        }
    }
    
}
