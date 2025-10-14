//
//  EditSheet.swift
//  appteam
//
//  Created by aakesh y on 10/9/25.
//
import SwiftUI

struct EditSheet: View {
    // TODO: Add title binding
    @Binding var reminderTitle: String
    @Binding var selectedColor: Color
    @Binding var page: RemindersPage
    @Binding var isEditing: Bool
    
    var body: some View {
        VStack(spacing: 20) {
                // TODO: Add list.bullet.circle.fill icon and TextField
            HStack {
                Text("List Info")
                    .bold()
                Spacer()
                Button {
                    isEditing = false
                }
                label: {
                    Text("Done")
                }
            }
            .padding(.horizontal, 5)
            VStack {
                Image(systemName: "list.bullet.circle.fill")
                    .font(.system(size: 100))
                TextField("Reminder Name", text: $reminderTitle)
                    .bold()
                    .frame(width: 305, height: 40)
                    .padding(.horizontal)
                    .background(Color.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 16))
            }
            .padding()
            .background(Color.secondary.opacity(0.15), in: RoundedRectangle(cornerRadius: 16))
            
            ColorChooser(selectedColor: $selectedColor)
            
            Spacer()
        }
        .foregroundStyle(selectedColor)
        .padding()
    }
}


