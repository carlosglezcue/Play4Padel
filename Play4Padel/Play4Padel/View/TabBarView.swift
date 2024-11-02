//
//  TabBarView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.circle.fill")
                        .foregroundStyle(.black)
                }
            
            MatchListView()
                .tabItem {
                    Label("Matches", systemImage: "tennisball.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("My Profile", systemImage: "person.circle")
                }
        }
        .tint(.black)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TabBarView()
}
