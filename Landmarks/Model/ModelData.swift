//
//  ModelData.swift
//  Landmarks
//
//  Created by Shelfinna on 25/04/24.
//

import Foundation

// Definisi kelas ModelData yang mengonformasikan protocol ObservableObject.
@Observable
class ModelData {
    // Properti untuk menyimpan array landmark.
    var landmarks: [Landmark] = load("landmarkData.json")
}


var landmarks: [Landmark] = load("landmarkData.json")
// Memuat data landmark dari file JSON.

func load<T: Decodable>(_ filename: String) -> T {
// Fungsi generik untuk memuat data dari file JSON.
    
    let data: Data // Variabel untuk menyimpan data dari file JSON.
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        // Memeriksa apakah file JSON ditemukan di bundle utama.
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        // Membaca data dari file JSON.
        data = try Data(contentsOf: file)
    } catch {
        // Menangani kesalahan jika gagal membaca data.
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        // Memparsing data JSON menjadi objek menggunakan JSONDecoder.
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        // Menangani kesalahan jika gagal mem-parse data.
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

