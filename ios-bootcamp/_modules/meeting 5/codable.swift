//
//  codable.swift
//  appteam
//
//  Created by aakesh y on 10/21/25.
//

import SwiftUI

// Define the JSON

let json = """
{
  "orderId": 8765,
  "customer": {
    "id": 301,
    "name": "Jordan Lee",
    "email": "jordan@example.com"
  },
  "items": [
    {
      "productId": 1001,
      "name": "Notebook",
      "quantity": 2,
      "price": 5.99
    },
    {
      "productId": 1002,
      "name": "Pen Set",
      "quantity": 1,
      "price": 9.49
    }
  ],
  "totalAmount": 21.47
}
"""

// Create your structs here
// (Hint: you'll need at least three: Order, Customer, and Item)

struct Order: Codable {
    let orderId: Int
    let customer: Customer
    let items: [Item]
    let totalAmount: Double
}

struct Customer: Codable {
    let id: Int
    let name: String
    let email: String
}

struct Item: Codable {
    let productId: Int
    let name: String
    let quantity: Int
    let price: Double
}

func decode() {
    let data = json.data(using: .utf8)!
    
    // Decode the JSON data
    let decodedOrder: Order = try! JSONDecoder().decode(Order.self, from: data)
    
    
    // Print the decoded object
    print(decodedOrder.orderId)
    print(decodedOrder.customer)
    print(decodedOrder.items)
    print(decodedOrder.customer.email)
}

// Call the function in a view

struct newView: View {
    var body: some View {
        VStack {
            Button("decode") {
                decode() // Check the console below
            }
        }
    }
}

#Preview {
    newView()
}





//{
//    "first": "Alice",
//    "last": "Johnson",
//    "age": 28
//  },
//  {
//    "first": "Bob",
//    "last": "Smith",
//    "age": 35
//  },
//  {
//    "first": "Charlie",
//    "last": "Davis",
//    "age": 22
//}

struct Person: Codable {
    let first: String
    let last: String
    let age: Int
}

//{
//  "id": 42,
//  "name": "Bluebird Café",
//  "category": "Coffee Shop",
//  "rating": 4.8,
//  "address": {
//    "street": "123 Main Street",
//    "city": "Chapel Hill",
//    "state": "NC",
//    "zipCode": "27514"
//  },
//  "isOpen": true
//}

struct Place: Codable {
    let id: Int
    let name: String
    let category: String
    let rating: Float
    let address: Address
    let isOpen: Bool
}

struct Address: Codable {
    let street: String
    let city: String
    let state: String
    let zipCode: String
}

