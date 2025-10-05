//
//  week_threeView.swift
//  appteam
//
//  Created by aakesh y on 9/30/25.
//

import SwiftUI

struct week_threeView: View {
    @State private var count = 0

    var body: some View {
            VStack(spacing: 20) {
                Text("\(count)")
                HStack(spacing: 50) {
                    Button("-") {
                        count -= 1
                    }
                    Button("+") {
                        count += 1
                    }
                }
            }
            .font(.largeTitle)
        }
    }


struct bindingView: View {
    // TODO: Add missing properties here
    @State private var name: String = ""
    @State private var darkmode: Bool = false
    

    var body: some View {
        Form {
            Section("Profile") {
                TextField("Enter your name", text: $name)
            }
            Section("Preferences") {
                Toggle("Dark Mode", isOn: $darkmode)
            }
        }
    }
}

struct ParentView: View {
    @State private var isOn = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("The switch is \(isOn ? "ON" : "OFF")")
                .font(.title)
            
            // TODO: Pass a binding to the child view
            ChildToggleView(isOn: $isOn)
        }
        .padding()
    }
}

struct ChildToggleView: View {
    // TODO: Receive a binding from the parent
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle("Toggle me!", isOn: $isOn)
            .padding()
    }
}



#Preview {
    ParentView()
}

#Preview {
    ContentView()
}


#Preview {
    week_threeView()
}

#Preview {
    bindingView()
}

#Preview {
    ParentView()
}
