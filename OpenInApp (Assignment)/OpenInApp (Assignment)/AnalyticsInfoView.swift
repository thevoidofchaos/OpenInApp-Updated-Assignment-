//
//  AnalyticsInfoView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 30/05/24.
//

import SwiftUI

struct AnalyticsInfoView: View {
    var analytic: String = "Today's clicks"
    var analyticCount: String = "123"
    
    @Environment(\.colorScheme) var colorScheme
 
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                
                Image(systemName: "globe")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(Color(uiColor: .systemGreen))
                    .frame(width: 32, height: 32)
                    .padding()
                    .background {
                        Circle()
                            .foregroundStyle(Color(uiColor: .systemGreen).opacity(0.1))
                    }
                
                Spacer()
                
                Text(analyticCount != "" ? analyticCount : "0.0")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.primary)
                
                Text(analytic)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .padding()
            Spacer()
        }
            .frame(width: 150, height: 150)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(colorScheme == .light ? .white : .black)
            }
            .onTapGesture {
                impactFeedbackGenerator.impactOccurred()
            }
    }
}

struct AnalyticsInfoView_Preview: PreviewProvider {
    static var previews: some View {
        AnalyticsInfoView()
            .previewLayout(.sizeThatFits)
    }
}

