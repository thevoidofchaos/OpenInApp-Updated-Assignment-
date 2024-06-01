//
//  MainView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 02/06/24.
//

import SwiftUI

struct MainView: View {
    @State var selectedTabIndex: Int = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            LinksView()
                .tag(0)
            CoursesView()
                .tag(1)
            CampaignView()
                .tag(2)
            ProfileView()
                .tag(3)
        }
        .overlay {
            VStack {
                Spacer()
                CustomTabBarView(selectedIndex: $selectedTabIndex)
            }
        }
        
    }
}

#Preview {
    MainView()
}
