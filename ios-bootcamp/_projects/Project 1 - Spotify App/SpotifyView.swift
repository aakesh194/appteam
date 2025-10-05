//
//  SpotifyView.swift
//  appteam
//
//  Created by aakesh y on 9/16/25.
//

import SwiftUI

struct SpotifyView: View {
    @State private var sliderValue: Double = 0
    var body: some View {
        
        
        VStack (alignment: .leading) {
            
            HStack {
                Image(systemName: "chevron.down")
                Spacer()
                Text("t!mp")
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(.horizontal)
            
            Spacer()

        
            Image("90210")
                .resizable()
                .scaledToFit()
                .padding()
        
            
            Text("90210")
                .font(.title)
                .bold()
                .padding(.horizontal)
               
                
            HStack {
                Image(systemName: "e.square.fill")
                    .foregroundColor(.gray)
                Text("Travis Scott")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .bold()
                    
                Spacer()
                Image(systemName: "heart")
                    .font(.system(size: 20))
            }
            .padding(.horizontal)
            
 
            Slider(value: $sliderValue, in: 0...5.39)
                .padding(.horizontal)
                .accentColor(.white)
            
            HStack {
                Text("\(sliderValue, specifier: "%.2f")")
                    .font(.footnote)
                Spacer()
                Text("5:39")
                    .font(.footnote)
            }
            .padding(.horizontal)
            
            HStack {
                Image(systemName: "shuffle")
                    .foregroundColor(.green)
                Spacer()
                Image(systemName: "backward.end.fill")
                    .font(.system(size: 40))
                Image(systemName: "pause.circle.fill")
                    .font(.system(size: 50))
                Image(systemName: "forward.end.fill")
                    .font(.system(size: 40))
                Spacer()
                Image(systemName: "repeat")
            }
            .padding()
            .font(.system(size: 30))
            
            HStack {
                Image(systemName: "hifispeaker.2")
                Spacer()
                Image(systemName: "square.and.arrow.up")
            }
            .padding()
            
        }
        .background(Color(red: 0.576, green: 0.392, blue: 0.286))
        .foregroundStyle(Color.white)
    }
}

#Preview {
    SpotifyView()
}
