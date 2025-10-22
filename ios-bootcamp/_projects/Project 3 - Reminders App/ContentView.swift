//
//  ContentView.swift
//  appteam
//
//  Created by aakesh y on 10/9/25.
//

import SwiftUI

struct PageView: View {
    @State private var isEditing: Bool = false
    // TODO: Add an @State property to hold a RemindersPage struct
    @State var page = RemindersPage(
        title: "To-do list",
        items: [],
        color: .blue
    )
    @State private var selectedColor: Color = .red
    @State private var eachReminder: String = ""

    var body: some View {
        VStack {
            // TODO: Add header view
            HStack {
                Text(page.title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(page.color)

                Spacer()

                Button {
                    isEditing = true
                }
                label: {
                    Image(systemName: "info.circle")
                        .foregroundStyle(page.color)
                }
            }
            .padding()

            List {
                // TODO: Loop through the page's reminders using ForEach
                ForEach($page.items) { $reminder in
                    // TODO: Display each reminder row
                    HStack {
                        Button {
                            reminder.isCompleted.toggle()
                        }
                        label: {
                            Image(systemName: reminder.isCompleted ? "circle.fill" : "circle")
                                .foregroundStyle(page.color)
                        }
                        TextField("", text: $reminder.title)
                            .foregroundStyle(reminder.isCompleted ? .gray : .black)
                    }
                }

                .onDelete { indexSet in
                    page.items.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)

            // TODO: Add footer view

            HStack {
                Spacer()
                Button {
                    page.items.append(Reminder(title: ""))
                }
                label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(page.color)
                        .padding()
                }
            }
            .sheet(isPresented: $isEditing) {
                // TODO: Add remaining binding
                EditSheet(reminderTitle: $page.title, selectedColor: $page.color, page: $page, isEditing: $isEditing)
            }
        }
    }
}

#Preview {
    PageView()
}
