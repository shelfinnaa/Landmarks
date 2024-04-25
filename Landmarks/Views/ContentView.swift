//
//  ContentView.swift
//  Landmarks
//
//  Created by Shelfinna on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            // Menampilkan peta dengan tinggi 300 piksel.
            MapView()
                .frame(height: 300)
            
            // Menampilkan gambar lingkaran.
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            // Menampilkan informasi tentang landmark dalam VStack.
            VStack(alignment: .leading) {
                Text("Turtle Rock")
                    .font(.title)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider() // Garis pemisah.
                
                
                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()
            // Padding untuk konten dalam VStack.
            
            Spacer()
            // Spacer untuk menempatkan konten di bagian bawah halaman.
        }
    }
}

#Preview {
    ContentView()
}
