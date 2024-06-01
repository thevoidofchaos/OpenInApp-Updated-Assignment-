//
//  LinksView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 30/05/24.
//

import SwiftUI

struct LinksView: View {
    
    @State var networkModel: OIANetworkModel? = nil
    @State private var isLoading: Bool = true
    @State var selectedIndex: Int = 0
    @State var selectedTabIndex: Int = 0
    @State var isAlertPresented: Bool = false
    @State var errorMessage: String?
    
    var body: some View {
            VStack {
                HStack {
                    Text("Dashboard")
                    
                    Spacer()
                    
                    Image(systemName: "gear")
                }
                .foregroundStyle(.white)
                .font(.title)
                .fontWeight(.bold)
                .padding()
                
                ZStack {
                    
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 20, topTrailing: 20))
                        .foregroundStyle(Color(UIColor.systemGray6))
                        .ignoresSafeArea()
                    
                    if isLoading {
                        ProgressView {
                            Text("loading")
                        }
                    }
                    
                    if !isLoading && !isAlertPresented {
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(alignment: .center, spacing: 20) {
                                
                                HStack {
                                    GreetingView()
                                        .padding(.horizontal)
                                    
                                    Spacer()
                                }
                                
                                ChartView(networkModel: networkModel, selectedLinkTypeIndex: $selectedIndex)
                                    .padding()
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    
                                    if networkModel != nil {
                                        HStack {
                                            ForEach(networkModel!.toKeyValuePairs(), id: \.0) {key, value in
                                                AnalyticsInfoView(analytic: key, analyticCount: value)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                                
                                ButtonView(backgroundColor: Color(uiColor: .systemGray6), isSpacingRequired: false, text: "View Analytics", imageName: "chart.line.uptrend.xyaxis")
                                    .padding(.bottom)
                                
                                if let networkModel = networkModel {
                                    
                                    HStack {
                                        LinkTypeView(indexSelected: $selectedIndex)
                                            .padding(.horizontal)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "magnifyingglass")
                                            .foregroundStyle(.gray)
                                            .padding(10)
                                            .background {
                                                RoundedRectangle(cornerRadius: 12)
                                                    .foregroundStyle(Color(uiColor: .systemGray6))
                                                
                                            }
                                            .overlay {
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(Color.gray, lineWidth: 1)
                                            }
                                            .padding(.horizontal)
                                            .onTapGesture {
                                                impactFeedbackGenerator.impactOccurred()
                                            }
                                    }
                                    
                                    if selectedIndex == 0 {
                                        ForEach(networkModel.data
                                            .recentLinks, id: \.urlID) {link in
                                                LinkView(link: link)
                                                    .padding(.horizontal)
                                            }
                                    } else {
                                        ForEach(networkModel.data
                                            .topLinks, id: \.urlID) {link in
                                                LinkView(link: link)
                                                    .padding(.horizontal)
                                            }
                                        
                                    }
                                }
                                
                                
                                ButtonView(backgroundColor: Color.gray, isSpacingRequired: false, text: "View all Links", imageName: "link")
                                
                                VStack {
                                    ButtonView(backgroundColor: Color.green, isSpacingRequired: true, text: "Talk with us", imageName: "phone.fill")
                                    
                                    
                                    ButtonView(backgroundColor: Color.blue, isSpacingRequired: true, text: "Frequently Asked Questions")
                                        .padding(.bottom, 90)
                                }
                                .padding(.vertical)
                                
                            }
                            .padding(.top, 40)
                        }
                        
                        .clipShape(
                            UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 20, topTrailing: 20))
                        )
                        .ignoresSafeArea(.all)
                        
                    }
                    
                }
                .alert(isPresented: $isAlertPresented) {
                    Alert(title: Text(errorMessage ?? ""))
                }
                
            }
            .background(Color.blue)
        .onAppear {
            DispatchQueue.global().async {
                APICall().callAPI { oiaNetworkModel, error in
                    guard error == nil, let networkModel = oiaNetworkModel else {
                        isLoading = false
                        errorMessage = error?.localizedDescription
                        isAlertPresented = true
                        return
                    }
                    
                    self.networkModel = networkModel
                    
                    withAnimation(.easeIn) {
                        isLoading = false
                        isAlertPresented = false
                    }
                    
                }
            }
        }
    }
}

#Preview {
    LinksView()
}
