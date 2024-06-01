//
//  ChartView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 31/05/24.
//

import SwiftUI
import Charts

struct ChartView: View {
    
    @State var networkModel: OIANetworkModel?
    @Binding var selectedLinkTypeIndex: Int
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4),
                                                                                                             Color.accentColor.opacity(0)]),
                                                                                 startPoint: .top,
                                                                                 endPoint: .bottom)
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                Text("Overview")
                    .font(.headline)
                    .fontWeight(.light)
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                if selectedLinkTypeIndex == 0 {
                    DateView(lowerLimit: networkModel?.data.recentLinks.last?.createdAt.getDayAndMonth(), upperLimit: networkModel?.data.recentLinks.first?.createdAt.getDayAndMonth())
                } else if selectedLinkTypeIndex == 1 {
                    DateView(lowerLimit: networkModel?.data.topLinks.last?.createdAt.getDayAndMonth(), upperLimit: networkModel?.data.topLinks.first?.createdAt.getDayAndMonth())
                }
            }
            
            
            if let networkModel = networkModel {
                Chart(selectedLinkTypeIndex == 0 ? networkModel.data.recentLinks.reversed() : networkModel.data.topLinks.reversed(), id: \.urlID) { recentLink in
                    let date = recentLink.createdAt.getDate()
                        LineMark(
                            x: .value("Created At", date), y: .value("Total Clicks", recentLink.totalClicks)
                        )
                        .foregroundStyle(.primary)
                    
                    AreaMark(
                        x: .value("Created At", date), y: .value("Total Clicks", recentLink.totalClicks)
                    )
                    .foregroundStyle(linearGradient)
                }
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                .aspectRatio(1.5, contentMode: .fit)
                .padding(.vertical)
                
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(colorScheme == .light ? .white : .black)
        }
    }
}

#Preview {
    ChartView(selectedLinkTypeIndex: .constant(0))
}
