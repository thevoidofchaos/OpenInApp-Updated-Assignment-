//
//  ButtonView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 31/05/24.
//

import SwiftUI

struct ButtonView: View {
    
    var backgroundColor: Color = .green
    var isSpacingRequired: Bool = true
    var text: String = "View Analytics"
    var imageName: String = "questionmark.circle"
    
    var body: some View {
        HStack {
            if !isSpacingRequired {
                Spacer()
            }
            
            Image(systemName: imageName)
                .resizable()
                .frame(width: 22, height: 22)

            Text(text)
                .font(.headline)
            
                Spacer()
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(backgroundColor.opacity(0.1))
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(backgroundColor != Color(uiColor: .systemGray6) ? backgroundColor : Color(uiColor: .systemGray3), lineWidth: 1)
        }
        .frame(height: 40)
        .padding()
        .onTapGesture {
            impactFeedbackGenerator.impactOccurred()
        }
    }
}

#Preview {
    ButtonView()
}
