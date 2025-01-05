//
//  TabBarView.swift
//  Play4Padel
//
//  Created by Carlos Gonzalez on 2/11/24.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var viewModel: UserViewModel
    
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
                
                ProfileView(viewModel: $viewModel)
                    .tabItem {
                        Label("My Profile", systemImage: "person.circle")
                    }
            }
            .tint(.tabBarTint)
            .navigationBarBackButtonHidden(true)
    }
}

#Preview(traits: .sampleData) {
    TabBarView(viewModel: .constant(UserViewModel()))
}
