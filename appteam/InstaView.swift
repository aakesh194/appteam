//
//  InstaView.swift
//  appteam
//
//  Created by aakesh y on 9/16/25.
//

import SwiftUI

struct InstaView: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image("download (1)")
                    .frame(width: 30, height: 30)
                    .clipShape(.circle)
                Text("unc-chapelhill")
                    .font(.subheadline)
                    .bold()
                Spacer()
                Image(systemName: "ellipsis")
            }
            .padding(8)
            
            Image("download (1)")
                .resizable()
                .scaledToFit()
                
                
            HStack {
                Image(systemName: "heart")
                    .scaledToFit()
                Image(systemName: "message")
                Image(systemName: "paperplane")
                Spacer()
                Image(systemName: "bookmark")
            }
            .padding(8)
            
            VStack {
                Text("67676767 likes")
                    .font(.footnote)
                    .bold()
                Text("**unc-chapelhill** hdaskfjhkajsdhfgkja ")
                        .font(.footnote)
                Text("hey")
                        .font(.caption)
            }
            .padding()


        }
        
    }
}

#Preview {
    InstaView()
}
