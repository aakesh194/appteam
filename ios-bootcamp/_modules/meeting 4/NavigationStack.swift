//
//  NavigationStack.swift
//  appteam
//
//  Created by aakesh y on 10/14/25.
//

import SwiftUI

struct Animal: Identifiable {
    let id = UUID()
    let name: String
    let fact: String
}

struct NavExample: View {
    let animals = [
        Animal(name: "Dog", fact: "Dogs can learn over 1000 words."),
        Animal(name: "Cat", fact: "Cats sleep for around 13 to 16 hours a day."),
        Animal(name: "Elephant", fact: "Elephants are the only mammals that can't jump.")
    ]
    
    @State private var showingInfo = false
    
    var body: some View {
        NavigationStack {
            List(animals) { animal in
                // TODO: Add a NavigationLink here
                NavigationLink {
                    AnimalDetailView(animal:animal)
                    //Text(animal.fact)
                }
                label: {
                    Text(animal.name)
                }
            }
            // TODO: Add a navigation title for this screen
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingInfo = true
                    } label: {
                        Image(systemName: "info.circle")
                    }
                }
            }
            .alert("This app shows fun animal facts!", isPresented: $showingInfo) {
                Button("OK", role: .cancel) {}
            }
            .navigationTitle("Animals")
        }
        
    }
}

struct AnimalDetailView: View {
    let animal: Animal
    
    var body: some View {
        VStack(spacing: 20) {
            Text(animal.name)
                .font(.largeTitle)
                .bold()
            
            Text(animal.fact)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
        }
        // TODO: Add a navigation title here using the animal's name
        .navigationTitle(animal.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavExample()
}
