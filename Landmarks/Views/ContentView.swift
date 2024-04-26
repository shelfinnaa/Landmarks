//
//  ContentView.swift
//  Landmarks
//
//  Created by Shelfinna on 25/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
