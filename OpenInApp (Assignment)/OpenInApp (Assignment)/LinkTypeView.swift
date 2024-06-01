//
//  LinkTypeView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 31/05/24.
//

import SwiftUI

struct LinkTypeView: View {
    @Binding var indexSelected: Int
    var body: some View {
        
        HStack {
                Text("Recent Links")
                    .font(.headline)
                    .foregroundStyle(indexSelected == 0 ? Color.white : Color.gray)
                    .padding()
                    .onTapGesture {
                            indexSelected = 0
                        impactFeedbackGenerator.impactOccurred()
                    }
                    .background {
                        Capsule()
                            .frame(height: 40)
                            .foregroundStyle(indexSelected == 0 ? Color.blue : Color.clear)
                    }
            
            
                Text("Top Links")
                    .font(.headline)
                    .foregroundStyle(indexSelected == 1 ? Color.white : Color.gray)
                    .padding()
                    .onTapGesture {
                            indexSelected = 1
                        impactFeedbackGenerator.impactOccurred()
                    }
                    .background {
                        Capsule()
                            .frame(height: 40)
                            .foregroundStyle(indexSelected == 1 ? Color.blue : Color.clear)
                    }
        }
    }
}

#Preview {
    LinkTypeView(indexSelected: .constant(0))
}
