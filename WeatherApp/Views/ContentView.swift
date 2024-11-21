//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vagarth Pandey on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        Text("Hello, World!")
            .padding()
    }
}

#Preview {
    ContentView()
}
