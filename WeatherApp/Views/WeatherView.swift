//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Vagarth Pandey on 21/11/24.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "smoke.fill")
                                .font(.system(size: 40))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 0)
                    
                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1614730321146-b6fa6a46bcb4?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8fA%3D%3D")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather Details")
                        .bold().padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer.low", name: "Min. Temp.", value: (weather.main.tempMin.roundDouble() + "°"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "thermometer.high", name: "Max. Temp.", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind", value: (weather.wind.speed.roundDouble() + "m/s"))
                        
                        Spacer()
                        
                        WeatherRow(logo: "humidity", name: "Humidity    ", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color.white.opacity(0.5))
                .background(Color.black.opacity(0.1))
                .cornerRadius(radius: 20, corners: [.topLeft, .topRight])
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.black.opacity(0.1))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
