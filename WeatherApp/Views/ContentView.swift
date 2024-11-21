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
            if let location = locationManager.location {
                Text("Current Coordinates: \(location.longitude), \(location.latitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color.black.opacity(0.1))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
