//
//  WeeklyForecastView.swift
//  appteam
//
//  Created by aakesh y on 9/28/25.
//

import SwiftUI

struct Day: Identifiable {
    let id = UUID()
    var dayofweek: String
    var icon: String
    var iconColor: Color
    var lowTemp: Int
    var highTemp: Int
}

struct DayView: View {
    var day: Day
    var body: some View {
        HStack {
            Text(day.dayofweek)
                .bold()
                .frame(width: 50, alignment: .leading)
            Spacer()
            Image(systemName: day.icon)
                .foregroundStyle(day.iconColor)
            Spacer()
            Text("\(day.lowTemp)°")
            Spacer()
            HStack {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.blue.opacity(0.3))
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.blue)
                        .frame(width: Double((Double(day.highTemp - day.lowTemp)*3.33)))
                        .offset(x: Double(Double(day.lowTemp*30)/100))
                }
                .frame(width: 150, height: 8)
            }
            Spacer()
            Text("\(day.highTemp)°")

        }
        .padding(.horizontal, 3)
        .padding(.vertical, 5)
    }
}




struct WeeklyForecastView: View {
    let days: [Day] = [
        Day(dayofweek: "Today", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 59, highTemp: 78),
        Day(dayofweek: "Mon", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 60, highTemp: 80),
        Day(dayofweek: "Tue", icon: "cloud.fill", iconColor: .white, lowTemp: 61, highTemp: 80),
        Day(dayofweek: "Wed", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 63, highTemp: 78),
        Day(dayofweek: "Thu", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 55, highTemp: 69),
        Day(dayofweek: "Fri", icon: "cloud.sun.fill", iconColor: .white, lowTemp: 51, highTemp: 71),
        Day(dayofweek: "Sat", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 52, highTemp: 73),
        Day(dayofweek: "Sun", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 54, highTemp: 74),
        Day(dayofweek: "Mon", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 51, highTemp: 76),
        Day(dayofweek: "Tue", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 52, highTemp: 74)
        
    ]
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "calendar")
                Text("10-DAY FORECAST")
                    .font(.headline)
                    .font(.caption)
                    .foregroundStyle(Color.white.opacity(0.6))
                    .fontWeight(.medium)
            }
            
            ScrollView {
                VStack {
                    ForEach (days) { day in
                        DayView(day: day)
                    }
                }
            }
            .frame(height: 300)
        }
        .padding()
        .background(Color.blue.opacity(0.5))
        .cornerRadius(20)
        .foregroundStyle(Color.white)
        .padding(.horizontal, 20)
        .padding(.vertical, -2)
        
        
    }
}

#Preview {
    WeeklyForecastView()
}
