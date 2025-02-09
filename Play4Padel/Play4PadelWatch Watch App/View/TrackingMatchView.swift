//
//  TrackingMatchView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 22/10/24.
//

import SwiftUI

struct TrackingMatchView: View {
    
    @State private var viewModel = RegisterMatchViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selectedTab) {
            CloseMatchView(viewModel: viewModel)
                .tabItem {
                    Label("Finish", systemImage: "1.circle")
                }
                .tag(0)
            
            PointsView(viewModel: viewModel)
                .tabItem {
                    Label("Points", systemImage: "1.circle")
                }
                .tag(1)
            
            SetsViews(viewModel: viewModel)
                .tabItem {
                    Label("Sets", systemImage: "2.circle")
                }
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .navigationBarBackButtonHidden(true)
        .onAppear {
            viewModel.showPreviousDialog()
        }
        .confirmationDialog(
            "Do you want to play with Golden Point or Advantage?",
            isPresented: $viewModel.showDialog,
            titleVisibility: .visible
        ) {
            Button("Golden Point") {
                viewModel.hidePreviousDialog(true)
            }
            Button("Advantage") {
                viewModel.hidePreviousDialog(false)
            }
        }
    }
}

#Preview {
    TrackingMatchView()
}
