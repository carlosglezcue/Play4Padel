//
//  TrackingMatchView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 22/10/24.
//

import SwiftUI

struct TrackingMatchView: View {
    
    @State private var selectedTab: Int = 1
    @State private var viewModel = RegisterMatchViewModel()
    @State private var showDialog = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CloseMatchView(viewModel: $viewModel)
                .tabItem {
                    Label("Finish", systemImage: "1.circle")
                }
                .tag(0)
            
            PointsView(viewModel: $viewModel)
                .tabItem {
                    Label("Points", systemImage: "1.circle")
                }
                .tag(1)
            
            SetsViews(viewModel: $viewModel)
                .tabItem {
                    Label("Sets", systemImage: "2.circle")
                }
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .navigationBarBackButtonHidden(true)
        .onAppear {
            showDialog = true
        }
        .confirmationDialog(
            "Do you want to play with Golden Point or Advantage?",
            isPresented: $showDialog,
            titleVisibility: .visible
        ) {
            Button("Golden Point") {
                viewModel.isGoldenBall = true
            }
            Button("Advantage") {
                viewModel.isGoldenBall = false
            }
        }
    }
}

#Preview {
    TrackingMatchView()
}
