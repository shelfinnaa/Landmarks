//
//  Hike.swift
//  Landmarks
//
//  Created by Shelfinna on 26/04/24.
//

import Foundation

struct Hike: Codable, Hashable, Identifiable {
    var id: Int // ID hike.
    var name: String // Nama hike.
    var distance: Double // Jarak hike.
    var difficulty: Int // Tingkat kesulitan hike.
    var observations: [Observation] // Observasi hike.

    static var formatter = LengthFormatter() // Formatter untuk tampilan jarak hike.

    // Properti untuk teks jarak hike yang diformat.
    var distanceText: String {
        Hike.formatter.string(fromValue: distance, unit: .kilometer)
    }

    // Struktur yang merepresentasikan observasi dalam hike.
    struct Observation: Codable, Hashable {
        var distanceFromStart: Double // Jarak dari titik awal hike.
        var elevation: Range<Double> // Ketinggian dalam rentang.
        var pace: Range<Double> // Kecepatan dalam rentang.
        var heartRate: Range<Double> // Detak jantung dalam rentang.
    }
}


