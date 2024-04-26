//
//  Badge.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct Badge: View {
    // Tampilan untuk simbol-simbol badge.
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360.0
            )
        }
        .opacity(0.5)
    }
    
    var body: some View {
        ZStack {
            BadgeBackground() //Latar belakang badge.
            
            // Mengatur posisi dan skala dari simbol-simbol badge.
            GeometryReader { geometry in
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit() // Mengatur agar badge disesuaikan dengan ukuran konten.
    }
}

#Preview {
    Badge()
}
