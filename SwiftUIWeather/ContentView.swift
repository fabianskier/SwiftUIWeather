//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Oscar Cristaldo on 2022-07-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Background
            LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                // City
                Text("Asunción, PY")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                VStack(spacing: 8) {
                    // Wheater icon
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    // Temperature
                    Text("32°")
                        .font(.system(size: 70, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    WheaterDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 32)
                    WheaterDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 28)
                    WheaterDayView(dayOfWeek: "THU", imageName: "cloud.rain.fill", temperature: 18)
                    WheaterDayView(dayOfWeek: "FRI", imageName: "cloud.bolt.rain.fill", temperature: 20)
                    WheaterDayView(dayOfWeek: "SAT", imageName: "cloud.sun.rain.fill", temperature: 24)
                }
                Spacer()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WheaterDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}
