//
//  CurrentView.swift
//  appteam
//
//  Created by aakesh y on 9/23/25.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.blue, Color.cyan,  Color.white],
    startPoint: .top, endPoint: .bottom)

struct CurrentView: View {
    var body: some View {
        ZStack {
            backgroundGradient
                //.resizable()
                //.aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Cary")
                        .font(.title)
                    Text("55°")
                        .font(.system(size: 70))
                        .fontWeight(.thin)
                    Text("Sunny")
                    Text("H:57° L:45°")
                }
                .padding(.vertical, 15)
                .foregroundStyle(Color.white)
                Spacer()
                HourlyForecastView()
                WeeklyForecastView()
            }
        }
    }
}


#Preview {
    CurrentView()
}
