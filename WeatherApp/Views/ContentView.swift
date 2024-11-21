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
        VStack {
            WelcomeView()
                .environmentObject(locationManager)
        }
        .background(Color.black.opacity(0.1))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
