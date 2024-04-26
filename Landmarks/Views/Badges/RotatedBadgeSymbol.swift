//
//  RotatedBadgeSymbol.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct RotatedBadgeSymbol: View {
    let angle: Angle // Sudut rotasi.
    
    var body: some View {
        BadgeSymbol() // Menggunakan tampilan BadgeSymbol sebagai dasar.
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
        // Menerapkan rotasi pada simbol badge.
    }
}

#Preview {
    RotatedBadgeSymbol(angle: Angle(degrees: 5))
}
