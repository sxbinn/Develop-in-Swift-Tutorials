//
//  ContentView.swift
//  WeatherForecast
//
//  Created by kosoobin on 3/26/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top) {
//                HStack(alignment: .top) {
                    DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                    
                    DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                    
                    DayForecast(day: "Wed", isRainy: false, high: 75, low: 55)
                    
                    DayForecast(day: "Thu", isRainy: true, high: 75, low: 55)
//                }
                
//                HStack(alignment: .top) {
                    DayForecast(day: "Fri", isRainy: false, high: 70, low: 50)
                    
                    DayForecast(day: "Sat", isRainy: false, high: 60, low: 40)
                    
                    DayForecast(day: "Sun", isRainy: true, high: 75, low: 55)
                    
                    
//                }
            }
        }
        
        WeekForecast(avgLow: 4, avgHigh: 4, numOfSun: 4, numOfRain: 4)
    }
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            "cloud.rain.fill"
        } else {
            "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy {
            .blue
        } else {
            .yellow
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(5)
            
            Text("High: \(high)º")
                .fontWeight(.semibold)
//                .font(.footnote)
            
            Text("Low: \(low)º")
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
//                .font(.footnote)
        }
        .padding()
    }
}

struct WeekForecast: View {
    let avgLow: Double
    let avgHigh: Double
    let numOfSun: Int
    let numOfRain: Int
    
    var body: some View {
        VStack {
            Text("Average Low: \(avgLow)")
            
            Text("Average High: \(avgHigh)")
            
            Text("Number of days sun: \(numOfSun)")
            
            Text("Number of days rain: \(numOfRain)")
        }
    }
}

#Preview {
    ContentView()
}
