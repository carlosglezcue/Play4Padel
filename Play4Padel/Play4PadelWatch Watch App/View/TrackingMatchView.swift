//
//  TrackingMatchView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 22/10/24.
//

import SwiftUI

struct TrackingMatchView: View {
    
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CloseMatchView()
                .tabItem {
                    Label("Finish", systemImage: "1.circle")
                }
                .tag(0)
            
            PointsView()
                .tabItem {
                    Label("Points", systemImage: "1.circle")
                }
                .tag(1)
            
            SetsViews()
                .tabItem {
                    Label("Sets", systemImage: "2.circle")
                }
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TrackingMatchView()
}
