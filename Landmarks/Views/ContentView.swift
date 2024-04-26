//
//  ContentView.swift
//  Landmarks
//
//  Created by Shelfinna on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    
    // Membuat state untuk menyimpan pilihan tab
    @State private var selection: Tab = .featured
    
    enum Tab { // Enum untuk menentukan jenis tab
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome() // Tampilan utama untuk tab Featured
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured) // Menandai tab sebagai Featured
            
            
            LandmarkList() // Tampilan utama untuk tab List
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list) // Menandai tab sebagai List
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
