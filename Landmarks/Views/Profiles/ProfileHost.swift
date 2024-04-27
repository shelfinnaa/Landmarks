//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    // Menerima editMode dari lingkungan SwiftUI
    @Environment(ModelData.self) var modelData
    // Menerima ModelData dari lingkungan SwiftUI
    @State private var draftProfile = Profile.default
    // Menyimpan profil yang akan disunting dalam state
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                // Menampilkan tombol "Cancel" jika dalam mode edit
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        // Mengembalikan profil yang belum disunting
                        editMode?.animation().wrappedValue = .inactive
                        // Menonaktifkan mode edit dengan animasi
                    }
                }
                Spacer()
                EditButton()
                // Menampilkan tombol Edit
            }
            // Menampilkan ringkasan profil jika tidak dalam mode edit
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                // Menampilkan editor profil jika dalam mode edit
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
            
            
        }
        .padding()
    }
}


#Preview {
    ProfileHost()
        .environment(ModelData())
}
