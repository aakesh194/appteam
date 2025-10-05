//
//  counteyView.swift
//  appteam
//
//  Created by aakesh y on 9/30/25.
//

import SwiftUI

struct CounteyView: View {
    // TODO: Track current occupancy state
    @State private var people: Int = 0
    // TODO: Track max occupancy state
    @State private var maxPeople: Int = 20
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.red.ignoresSafeArea()
                Color.blue.ignoresSafeArea()
                    .opacity(Double(people) / Double(maxPeople))
                
                VStack {
                    HStack {
                        NavigationLink {
                            SettingsView(maxPeople: $maxPeople)
                        } label: {
                            Text("\(people) people")
                            Spacer()
                            Image(systemName: "gear")
                        }
                    }
                    .font(.system(size: 50))
                    
                    Spacer()
                    
                    HStack {
                        Button {
                            if people > 0 {
                                people -= 1
                            }
                        } label: {
                            Image(systemName: "minus")
                        }
                        
                        Spacer()
                        
                        Button {
                            if people < maxPeople {
                                people += 1
                            }
                        }
                        label: {
                            Image(systemName: "plus")
                        }
                    }
                    .font(.system(size: 75))
                    .padding()
                }
            }
        }
    }
}
    

struct SettingsView: View {
    // TODO: Get and set occupancy state
    @Binding var maxPeople: Int
    
    var body: some View {
        // TODO: Add Stepper
        Stepper("Maximum Occupancy: \(maxPeople)", value: $maxPeople)
        Spacer()
    }
}

#Preview {
    CounteyView()
}
