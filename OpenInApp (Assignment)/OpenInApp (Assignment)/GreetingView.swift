//
//  GreetingView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 01/06/24.
//

import SwiftUI

struct GreetingView: View {
    
    @State var hour: Int = Date().get(.hour)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("\(Greeting.getTimeOfDay(for: hour).rawValue)")
                .font(.headline)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
            
            Text("Ajay Manva 👋")
                .font(.title2)
                .fontWeight(.bold)
            
        }
    }
}

#Preview {
    GreetingView()
}

enum Greeting: String {
    case morning = "Good Morning"
    case afternoon = "Good Afternoon"
    case evening = "Good Evening"
    case night = "Good Night"
    
    static func getTimeOfDay(for hour: Int) -> Greeting {
        switch hour {
        case 6..<12:
            return .morning
        case 12..<17:
            return .afternoon
        case 17..<21:
            return .evening
        default:
            return .night
        }
    }
}
