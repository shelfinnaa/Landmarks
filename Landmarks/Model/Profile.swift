//
//  Profile.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import Foundation

struct Profile {
    // Properti dari struct Profile
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    // Mendefinisikan sebuah konstanta statis `default` bertipe Profile dengan nama pengguna default
    static let `default` = Profile(username: "g_kumar")

    // Mendefinisikan sebuah enumerasi bernama Season untuk merepresentasikan musim dengan emoji yang sesuai
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        // Memberikan properti id untuk enumerasi Season, yang merupakan nilai mentahnya
        var id: String { rawValue }
    }
}
