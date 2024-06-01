//
//  DateView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 31/05/24.
//

import SwiftUI

struct DateView: View {
    
    var lowerLimit: String?
    var upperLimit: String?
    
    
    var body: some View {
        HStack {
        Text("\(lowerLimit ?? "22 Aug") - \(upperLimit ?? "23 Sept")")
                .foregroundStyle(.primary)
            
            Image(systemName: "clock")
                .padding(.leading)
                .foregroundStyle(.primary)
            }
        .font(.system(size: 14))
        .padding()
        .frame(height: 35)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray.opacity(0.5), lineWidth: 1)
        }
    }
}

#Preview {
    DateView()
}
