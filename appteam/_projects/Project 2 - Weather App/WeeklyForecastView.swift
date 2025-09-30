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
            Spacer()
            Text("\(day.lowTemp)°")
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.white)
                .frame(width: 50, height: 5)
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.blue)
                .frame(width: 10, height: 5)
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.white)
                .frame(width: 50, height: 5)
            Text("\(day.highTemp)°")
            Spacer()
        }
        .padding(.horizontal, 3)
        .padding(.vertical, 5)
    }
}




struct WeeklyForecastView: View {
    let days: [Day] = [
        Day(dayofweek: "Today", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Mon", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Tue", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Wed", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Thu", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Fri", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Sat", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Sun", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Mon", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57),
        Day(dayofweek: "Tue", icon: "sun.max.fill", iconColor: .yellow, lowTemp: 57, highTemp: 57)
        
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
