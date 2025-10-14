//
//  meeting_2View.swift
//  appteam
//
//  Created by aakesh y on 9/23/25.
//

import SwiftUI

struct Book {
    var title: String
    var author: String
    var pages: Int
}

    var bookInstance: Book = .init(title: "Harry Potter", author: "JK Rowling", pages: 500)

//  bookInstance.title
//  bookInstance.author

//  what I wrote: var HarryPotter = Book(title:"HarryPotter", author:"JK Rowling", pages:100)


struct Song {
    var title: String
    var artist: String
    var duration: Int
    
    func description() -> String { // have to specify return type
        return "\(title) by \(artist)"
    }
}


// EXAMPLE 2a: SUBVIEW

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProfileCard(name: "Alex", age: 22)
            ProfileCard(name: "Sam", age: 25)
        }
        .padding()
    }
}
        
        
        
struct ProfileCard: View {
    var name: String
    var age: Int
            
    var body: some View {
        VStack(spacing: 20) {
            Text(name)
                .font(.headline)
            Text("Age: \(age)")
                .font(.subheadline)
        }
        .padding()
        .background(.blue.opacity(0.2))
        .cornerRadius(10)
    }
}

// EXAMPLE 2b: SUBVIEW

struct SubView: View {
    var body: some View {
        VStack(spacing: 20) {
            MovieCard(name: "Inception", director: "Christopher Nolan", year: 2010)
            MovieCard(name: "The Matrix", director: "The Wachowskis", year: 1999)
        }
        .padding()
    }
}

struct MovieCard: View {
    var name: String
    var director: String
    var year: Int
    
    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
            Text("Directed by \(director)")
                .font(.subheadline)
            Text("Released in \(year)")
                .font(.caption)
        }
        .padding()
        .background(.green.opacity(0.2))
        .cornerRadius(10)
    }
}


//EXAMPLE 3: FOREACH

struct ForEachView: View {
    let colors: [String] = ["Red", "Green", "Blue", "Purple"]
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(colors, id: \.self) { color in
                Text(color)
                    .font(.title2)
            }
            .padding()
        }
    }
}


struct Profile: Identifiable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ProfileView: View {
    let profiles: [Profile] = [
        Profile(name: "Alex", age: 22),
        Profile(name: "sam", age: 25),
        Profile(name: "J", age: 30)
    ]
    
    var body: some View {
        VStack {
            ForEach(profiles) { profile in
                ProfileCardView(name: profile.name, age: profile.age)
            }
        }
    }
}

struct ProfileCardView: View {
    var name: String
    var age: Int

    var body: some View {
        VStack {
            Text(name)
                .font(.headline)
            Text("Age: \(age)")
                .font(.subheadline)
        }
        .padding()
        .background(Color.blue.opacity(0.2))
        .cornerRadius(10)
    }
}



#Preview {
    ContentView()
}
    
#Preview {
    SubView()
}
    
#Preview {
    ForEachView()
}
