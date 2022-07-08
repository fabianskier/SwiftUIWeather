//
//  ContentView.swift
//  SwiftUIWeather
//
//  Created by Oscar Cristaldo on 2022-07-06.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var weatherDay: [WeatherDay] = [
        WeatherDay(dayOfWeek: "TUE",
                   imageName: "sun.max.fill",
                   temperature: 32),
        WeatherDay(dayOfWeek: "WED",
                   imageName: "cloud.sun.fill",
                   temperature: 28),
        WeatherDay(dayOfWeek: "THU",
                   imageName: "cloud.rain.fill",
                   temperature: 17),
        WeatherDay(dayOfWeek: "FRI",
                   imageName: "cloud.bolt.rain.fill",
                   temperature: 20),
        WeatherDay(dayOfWeek: "SAT",
                   imageName: "cloud.sun.rain.fill",
                   temperature: 24)
    ]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Asunción, PY")
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "sun.max.fill", temperature: 32)
                
                HStack(spacing: 20) {
                    // https://www.hackingwithswift.com/forums/swiftui/compiler-warning-non-constant-range-argument-must-be-an-integer-literal/14878
                    ForEach(0 ..< weatherDay.count, id: \.self) { element in
                        WeatherDayView(weatherDay: weatherDay[element])
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

// MARK: - BackgroundView
struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

// MARK: - CityTextView
struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

// MARK: - MainWeatherStatusView
struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }
        .padding(.bottom, 40)
    }
}

// MARK: - WeatherDayView
struct WeatherDayView: View {
    
    var weatherDay: WeatherDay
    
    var body: some View {
        VStack {
            Text(weatherDay.dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: weatherDay.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(weatherDay.temperature)°")
                .font(.system(size: 28, weight: .bold, design: .default))
                .foregroundColor(.white)
        }
    }
}

// MARK: - WeatherButtonView
struct WeatherButtonView: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

// MARK: - WeatherDay
struct WeatherDay {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
}
