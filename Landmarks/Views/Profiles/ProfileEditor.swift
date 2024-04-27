//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Shelfinna on 27/04/24.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    // Properti untuk menyunting profil pengguna
    
    // Rentang tanggal yang dapat dipilih untuk tujuan profil
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username) // TextField untuk menyunting username
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
                // Toggle untuk mengaktifkan atau menonaktifkan notifikasi
            }
            
            Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                ForEach(Profile.Season.allCases) { season in
                    Text(season.rawValue).tag(season)
                    // Picker untuk memilih foto musiman
                }
            }
            
            DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
                Text("Goal Date")
                // DatePicker untuk memilih tanggal tujuan
            }
            
        }
    }
}


#Preview {
    ProfileEditor(profile: .constant(.default))
}
