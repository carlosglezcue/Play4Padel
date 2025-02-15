//
//  HomeView.swift
//  PersonalProjectWatch Watch App
//
//  Created by Carlos Gonzalez on 12/10/24.
//

import SwiftUI
import HealthKit

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink(destination: TrackingMatchView()) {
                    HStack(alignment: .firstTextBaseline) {
                        Image(systemName: "play.circle")
                        Text("Play match")
                            .font(.body)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .tint(.green)
                
                NavigationLink(destination: HistoryView()) {
                    HStack {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                        Text("History")
                            .font(.body)
                        Spacer()
                    }
                    .padding(.horizontal)
                }
                .tint(.blue)
            }
            .padding()
        }
        .task {
            await viewModel.configureHome()
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK") {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}

#Preview(traits: .sampleData) {
    HomeView()
}
