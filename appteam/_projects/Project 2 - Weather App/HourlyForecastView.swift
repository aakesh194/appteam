//
//  HourlyForecastView.swift
//  appteam
//
//  Created by aakesh y on 9/23/25.
//

import SwiftUI


struct Hour: Identifiable {
    let id = UUID()
    var time: String
    var icon: String
    var iconColor: Color
    var temp: Int
}

struct HourView: View {
    var hour: Hour
    
    var body: some View {
        VStack {
            Text(hour.time)
                .bold()
                //.font(.headline)
            Image(systemName: hour.icon)
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                .foregroundStyle(hour.iconColor)
            Text("\(hour.temp)°")
                .font(.headline)
        }
        .padding(.horizontal, 9)
        .padding(.vertical, 5)
    }
}

struct HourlyForecastView: View {
    let hours: [Hour] = [
        Hour(time: "NOW", icon: "sun.max.fill", iconColor: .yellow, temp: 54),
        Hour(time: "9AM", icon: "sun.max.fill", iconColor: .yellow, temp: 55),
        Hour(time: "10AM", icon: "sun.max.fill", iconColor: .yellow, temp: 57),
        Hour(time: "11AM", icon: "cloud.sun.fill", iconColor: .white, temp: 57),
        Hour(time: "12PM", icon: "cloud.sun.fill", iconColor: .white, temp: 55),
        Hour(time: "1PM", icon: "cloud.sun.fill", iconColor: .white, temp: 55),
        Hour(time: "2PM", icon: "cloud.sun.fill", iconColor: .white, temp: 55),
        Hour(time: "3PM", icon: "cloud.sun.fill", iconColor: .white, temp: 55),
        Hour(time: "4PM", icon: "cloud.sun.fill", iconColor: .white, temp: 55),
    ]
    
    var body: some View {
        VStack (alignment: .leading) {
            
            HStack {
                Image(systemName: "clock")
                Text("HOURLY FORECAST")
                    .font(.headline)
                    .foregroundStyle(Color.white.opacity(0.6))
                    .fontWeight(.medium)
            }
            
            ScrollView (.horizontal) { 
                HStack {
                    ForEach(hours) { hour in
                        VStack {
                            HourView(hour: hour)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.blue.opacity(0.6))
        .cornerRadius(20)
        .padding(.horizontal, 13)
        .padding(.vertical, -2)
        .padding(8)
        .foregroundStyle(Color.white)
    }
}

#Preview {
    HourlyForecastView()
}
