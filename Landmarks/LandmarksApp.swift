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
#if !os(watchOS)
        .commands {
            LandmarkCommands()
        }
#endif
        
#if os(watchOS)
        WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
#endif
        
#if os(macOS)
        Settings {
            LandmarkSettings()
        }
#endif
        
    }
}
